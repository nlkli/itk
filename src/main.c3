module itk;

import itk::rl;

import std::io;
import std::io::file;
import std::os::process;
import std::collections::list;
import std::encoding::json;

import std::math::geometry;
import std::math::vector;

faultdef PCALL_FAILED;
faultdef NOT_VALID_IMG;

struct StreamInfo
{
    int width;
    int height;
}

struct FFProbeJson
{
    StreamInfo[] streams;
}

fn String? tread_process_output(Process* p)
{
    DString buff;
    buff.tinit();

    char[1024] chunk;
    while (true)
    {
        sz n = p.read_stdout(&chunk, chunk.len)!;
        if (n == 0) break;
        buff.append_bytes(chunk[:n]);
    }

    CInt status = p.join()!;
    if (status != 0)
    {
        return PCALL_FAILED~;
    }

    return buff.str_view();
}

fn FFProbeJson? call_ffprobe(Allocator allocator, String path) => @pool()
{
    Process p = process::spawn(
        {
            "ffprobe", "-v", "quiet", "-print_format", "json", "-show_streams", path
        }
    )!;
    defer (void)p.destroy();
    String out = tread_process_output(&p)!;

    return json::unmarshal(allocator, out, FFProbeJson)!;
}

fn Image? load_png_from_media(String path)
{
    // ffmpeg -i input.jpg -frames:v 1 -f image2pipe -vcodec png -
    Process p = process::spawn(
        {
            "ffmpeg", "-i", path, "-frames:v", "1", "-f", "image2pipe", "-vcodec", "png", "-"
        }
    )!;
    defer (void)p.destroy();
    String out = tread_process_output(&p)!;

    Image img = rl::load_image_from_memory(".png", (ZString)out, out.len);

    if (!rl::is_image_valid(img))
    {
        rl::unload_image(img);
        return NOT_VALID_IMG~;
    }

    return img;
}

struct Canvas
{
    Rect r;
    Camera2D cam;
}

fn void Canvas.render(&self, State* s)
{
    self.cam.offset = { self.r.width * 0.5, self.r.height * 0.5 };
    // c.cam.Target = cs.Shift

    rl::begin_scissor_mode(
        (int)self.r.x,
    (int)self.r.y,
    (int)self.r.width,
    (int)self.r.height,
    );
    defer rl::end_scissor_mode();
    rl::begin_mode2d(self.cam);
    defer rl::end_mode2d();

    foreach (&item : s.items)
    {
        item.render(s);
    };

    if (!s.is_mouse_captured && rl::is_mouse_button_down((int)MouseButton.MOUSE_BUTTON_LEFT))
    {
        self.cam.target -= rl::get_mouse_delta() / self.cam.zoom;
    }
    if (float w = rl::get_mouse_wheel_move())
    {
        Vec2 mpw = rl::get_mouse_position() - self.cam.offset;
        Vec2 world_before = self.cam.target + mpw / self.cam.zoom;
        self.cam.zoom = (float)max(self.cam.zoom - w * 0.05, 0.02);
        self.cam.target = world_before - mpw / self.cam.zoom;
    }
}

struct State
{
    Canvas canvas;
    List{Item} items;
    Vec2 mouse_pos;
    bool is_mouse_captured;
}

struct Item
{
    Texture2D t;
    Vec2 orig_size;
    Vec2 pos;
    bool is_selected;
    bool is_drag;
}

fn void Item.render(&self, State* s)
{

    self.is_selected = false;
    if (!s.is_mouse_captured)
    {
        Rect r = { self.pos.x, self.pos.y, self.t.width, self.t.height };
        Vec2 wmp = rl::get_screen_to_world2d(s.mouse_pos, s.canvas.cam);
        if (r.contains_point(wmp))
        {
            rl::draw_rectangle_lines_ex(r, 2., rl::MAGENTA);
            if (rl::is_mouse_button_down((int)MouseButton.MOUSE_BUTTON_LEFT))
            {
                self.pos += rl::get_mouse_delta() / s.canvas.cam.zoom;
            }
            s.is_mouse_captured = true;
            self.is_selected = true;
        }
    }
    rl::draw_texture(self.t, (int)self.pos.x, (int)self.pos.y, rl::WHITE);
}

fn String? run(Args args)
{
    rl::set_trace_log_level((int)TraceLogLevel.LOG_FATAL);
    rl::set_config_flags((uint)ConfigFlags.FLAG_WINDOW_RESIZABLE);

    rl::init_window(args.win_width, args.win_height, "itk");
    defer rl::close_window();

    rl::set_target_fps(60);

    State* s = mem::new(
        State,
        { .canvas =
        { .r =
        { 0, 0,
        rl::get_screen_width(),
    rl::get_screen_height() }, .cam = { .zoom = 0.8 } } }
    );
    s.items.init(mem);
    defer free(s);
    defer s.items.free();

    Vec2 spawn_pos;
    foreach (mf : args.media_files)
    {
        Image img = load_png_from_media(mf)!;
        Texture2D t = rl::load_texture_from_image(img);
        rl::unload_image(img);
        s.items.push(
            {
                .t = t, .pos = spawn_pos,
            }
        );
        spawn_pos += 50;
    }

    while (!rl::window_should_close())
    {
        rl::begin_drawing();
        defer rl::end_drawing();

        rl::clear_background({});

        s.mouse_pos = rl::get_mouse_position();
        s.is_mouse_captured = false;
        if (rl::is_window_resized())
        {
            s.canvas.r.size = { rl::get_screen_width(), rl::get_screen_height() };
        }
        s.canvas.render(s);
    }

    return "";
}

// fn void init_window(int width, int height, ZString title)
struct Args
{
    int win_width, win_height;
    String[] media_files;
}

fn Args parse_args(String[] a) => @pool()
{
    Args args = { .win_width = 800, .win_height = 600 };
    List{String} buff;
    buff.tinit();
    char last;
    foreach (s : a[1..])
    {
        if (s.starts_with("--")) {}

        else if (s.starts_with("-"))
        {
            switch (String ss = s.strip_prefix("-"))
            {
                case "w":
                    last = ss[0];
                case "h":
                    last = ss[0];
                default:
            }
        }

        else
        {
            if (last)
            {
                switch (last)
                {
                    case 'w':
                        args.win_width = s.to_int()!!;
                    case 'h':
                        args.win_height = s.to_int()!!;
                    default:
                }
                last = 0;
            } else
            {
                if (!file::is_file(s))
                {
                    io::eprintfn("File not found: %s", s);
                    std::os::exit(1);
                }
                buff.push(s);
            }
        }
    }
    args.media_files = buff.to_array(mem);
    return args;
}

fn void main(String[] args)
{
    Args a = parse_args(args);
    defer free(a.media_files);

    if (String s = run(a)!!)
    {
        io::printfn(s);
    }
}
