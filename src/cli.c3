module itk::cli;

import std::collections::list;
import std::io::file;
import std::os;

struct Args
{
    int win_width, win_height;
    String output;
    String[] media_files;
}

fn void Args.free(&self)
{
    free(self.media_files);
}

fn Args parse_args(String[] a) => @pool()
{
    Args args = { .win_width = 800, .win_height = 600 };

    List{String} buff;
    buff.tinit();

    char last;
    foreach (s : a[1..])
    {
        if (s.starts_with("--"))
        {
            switch (String opt = s.strip_prefix("--"))
            {
                case "output":
                    last = 'o';
                default:
            }
        }
        else if (s.starts_with("-"))
        {
            switch (String ss = s.strip_prefix("-"))
            {
                case "w":
                    last = ss[0];
                case "h":
                    last = ss[0];
                case "o":
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
                    case 'o':
                        args.output = s;
                    default:
                }
                last = 0;
            }
            else
            {
                if (!file::is_file(s))
                {
                    io::eprintfn("File not found: %s", s);
                    os::exit(1);
                }
                buff.push(s);
            }
        }
    }
    args.media_files = buff.to_array(mem);

    return args;
}
