module itk;

import itk::rl;

import std::io;
import std::io::file;
import std::os::process;
import std::collections::list;
import std::encoding::json;

import std::math::geometry;

faultdef PCALL_FAILED;

struct Stream
{
    int width;
    int height;
}

struct ProbeResult
{
    Stream[] streams;
}

const String[] ARGS = { "ffprobe", "-v", "quiet", "-print_format", "json", "-show_streams", "/Users/nlkli/Desktop/output.jpg" };
// const String[] ARGS = { "echo", "hello" };

fn String? tpcall()
{
    Process p = process::spawn(
        ARGS
    )!;
    defer (void)p.destroy();

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

struct Canvas
{
    Rect r;
    Camera2D cam;
}

fn void Canvas.render(Canvas* c)
{
    c.cam.offset = { c.r.x, c.r.y };
    // c.cam.Target = cs.Shift

    rl::begin_scissor_mode(
        (int)c.r.x,
    (int)c.r.y,
    (int)c.r.width,
    (int)c.r.height,
    );
    defer rl::end_scissor_mode();
    rl::begin_mode2d(c.cam);
    defer rl::end_mode2d();

    Rect r;
    r.x = 100.;
    r.y = 400.;
    r.size = { 200., 200. };
    rl::draw_rectangle_rec(
        {
            r.x, r.y, r.width, r.height,
        }
        , rl::GREEN);

    if (rl::is_mouse_button_down((int)MouseButton.MOUSE_BUTTON_LEFT))
    {
        Vector2 md = rl::get_mouse_delta();
        c.cam.target.x -= md.x;
        c.cam.target.y -= md.y;
    }
    c.cam.zoom -= rl::get_mouse_wheel_move() * 0.05;
}

struct State
{
    Canvas canvas;
}

fn void main()
{
    rl::set_config_flags((uint)ConfigFlags.FLAG_WINDOW_RESIZABLE);

    rl::init_window(800, 600, "itk");
    defer rl::close_window();

    rl::set_target_fps(60);

    State* s = mem::new(State);
    s.canvas.r = { 0, 0, rl::get_screen_width(), rl::get_screen_height() };
    s.canvas.cam.zoom = 1.;

    while (!rl::window_should_close())
    {
        rl::begin_drawing();
        defer rl::end_drawing();

        rl::clear_background({});

        // rl::draw_rectangle(10, 10, 60, 60, { 255, 255, 255, 255 });

        if (rl::is_window_resized())
        {
            s.canvas.r.size = { rl::get_screen_width(), rl::get_screen_height() };
        }
        s.canvas.render();
    }

    // String output = tpcall()!!;
    //
    // io::printfn("output: %s", output);
    //
    // ProbeResult result = json::unmarshal(tmem, output, ProbeResult)!!;
    //
    // io::printfn("%s", result.streams[0].width);

    // String out = json::marshal(tmem, result, json::SPACE_2)!;
    // io::printn(out);
}
