module itk::rl;

const Color LIGHTGRAY = { 200, 200, 200, 255 };  // Light Gray
const Color GRAY = { 130, 130, 130, 255 };  // Gray
const Color DARKGRAY = { 80, 80, 80, 255 };  // Dark Gray
const Color YELLOW = { 253, 249, 0, 255 };  // Yellow
const Color GOLD = { 255, 203, 0, 255 };  // Gold
const Color ORANGE = { 255, 161, 0, 255 };  // Orange
const Color PINK = { 255, 109, 194, 255 };  // Pink
const Color RED = { 230, 41, 55, 255 };  // Red
const Color MAROON = { 190, 33, 55, 255 };  // Maroon
const Color GREEN = { 0, 228, 48, 255 };  // Green
const Color LIME = { 0, 158, 47, 255 };  // Lime
const Color DARKGREEN = { 0, 117, 44, 255 };  // Dark Green
const Color SKYBLUE = { 102, 191, 255, 255 };  // Sky Blue
const Color BLUE = { 0, 121, 241, 255 };  // Blue
const Color DARKBLUE = { 0, 82, 172, 255 };  // Dark Blue
const Color PURPLE = { 200, 122, 255, 255 };  // Purple
const Color VIOLET = { 135, 60, 190, 255 };  // Violet
const Color DARKPURPLE = { 112, 31, 126, 255 };  // Dark Purple
const Color BEIGE = { 211, 176, 131, 255 };  // Beige
const Color BROWN = { 127, 106, 79, 255 };  // Brown
const Color DARKBROWN = { 76, 63, 47, 255 };  // Dark Brown
const Color WHITE = { 255, 255, 255, 255 };  // White
const Color BLACK = { 0, 0, 0, 255 };  // Black
const Color BLANK = { 0, 0, 0, 0 };  // Blank (Transparent)
const Color MAGENTA = { 255, 0, 255, 255 };  // Magenta
const Color RAYWHITE = { 245, 245, 245, 255 };  // My own White (raylib logo)

// Type Aliases & Callbacks
alias Quaternion = Vector4;
alias Texture2D = Texture;
alias TextureCubemap = Texture;
alias RenderTexture2D = RenderTexture;
alias Camera = Camera3D;
alias ModelAnimPose = Transform*;
alias TraceLogCallback = fn void(int, ZString, CVaList);
alias LoadFileDataCallback = fn char*(ZString, int*);
alias SaveFileDataCallback = fn bool(ZString, void*, int);
alias LoadFileTextCallback = fn char*(ZString);
alias SaveFileTextCallback = fn bool(ZString, ZString);
alias AudioCallback = fn void(void*, uint);

constdef ConfigFlags : int
{
    FLAG_VSYNC_HINT = 64,
    FLAG_FULLSCREEN_MODE = 2,
    FLAG_WINDOW_RESIZABLE = 4,
    FLAG_WINDOW_UNDECORATED = 8,
    FLAG_WINDOW_HIDDEN = 128,
    FLAG_WINDOW_MINIMIZED = 512,
    FLAG_WINDOW_MAXIMIZED = 1024,
    FLAG_WINDOW_UNFOCUSED = 2048,
    FLAG_WINDOW_TOPMOST = 4096,
    FLAG_WINDOW_ALWAYS_RUN = 256,
    FLAG_WINDOW_TRANSPARENT = 16,
    FLAG_WINDOW_HIGHDPI = 8192,
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 16384,
    FLAG_BORDERLESS_WINDOWED_MODE = 32768,
    FLAG_MSAA_4X_HINT = 32,
    FLAG_INTERLACED_HINT = 65536
}

enum TraceLogLevel
{
    LOG_ALL,
    LOG_TRACE,
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
    LOG_NONE
}

constdef KeyboardKey : int
{
    KEY_NULL = 0,
    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,
    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,
    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336,
    KEY_BACK = 4,
    KEY_MENU = 5,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25
}

enum MouseButton
{
    MOUSE_BUTTON_LEFT,
    MOUSE_BUTTON_RIGHT,
    MOUSE_BUTTON_MIDDLE,
    MOUSE_BUTTON_SIDE,
    MOUSE_BUTTON_EXTRA,
    MOUSE_BUTTON_FORWARD,
    MOUSE_BUTTON_BACK
}

enum MouseCursor
{
    MOUSE_CURSOR_DEFAULT,
    MOUSE_CURSOR_ARROW,
    MOUSE_CURSOR_IBEAM,
    MOUSE_CURSOR_CROSSHAIR,
    MOUSE_CURSOR_POINTING_HAND,
    MOUSE_CURSOR_RESIZE_EW,
    MOUSE_CURSOR_RESIZE_NS,
    MOUSE_CURSOR_RESIZE_NWSE,
    MOUSE_CURSOR_RESIZE_NESW,
    MOUSE_CURSOR_RESIZE_ALL,
    MOUSE_CURSOR_NOT_ALLOWED
}

enum GamepadButton
{
    GAMEPAD_BUTTON_UNKNOWN,
    GAMEPAD_BUTTON_LEFT_FACE_UP,
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT,
    GAMEPAD_BUTTON_LEFT_FACE_DOWN,
    GAMEPAD_BUTTON_LEFT_FACE_LEFT,
    GAMEPAD_BUTTON_RIGHT_FACE_UP,
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN,
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT,
    GAMEPAD_BUTTON_LEFT_TRIGGER_1,
    GAMEPAD_BUTTON_LEFT_TRIGGER_2,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2,
    GAMEPAD_BUTTON_MIDDLE_LEFT,
    GAMEPAD_BUTTON_MIDDLE,
    GAMEPAD_BUTTON_MIDDLE_RIGHT,
    GAMEPAD_BUTTON_LEFT_THUMB,
    GAMEPAD_BUTTON_RIGHT_THUMB
}

enum GamepadAxis
{
    GAMEPAD_AXIS_LEFT_X,
    GAMEPAD_AXIS_LEFT_Y,
    GAMEPAD_AXIS_RIGHT_X,
    GAMEPAD_AXIS_RIGHT_Y,
    GAMEPAD_AXIS_LEFT_TRIGGER,
    GAMEPAD_AXIS_RIGHT_TRIGGER
}

enum MaterialMapIndex
{
    MATERIAL_MAP_ALBEDO,
    MATERIAL_MAP_METALNESS,
    MATERIAL_MAP_NORMAL,
    MATERIAL_MAP_ROUGHNESS,
    MATERIAL_MAP_OCCLUSION,
    MATERIAL_MAP_EMISSION,
    MATERIAL_MAP_HEIGHT,
    MATERIAL_MAP_CUBEMAP,
    MATERIAL_MAP_IRRADIANCE,
    MATERIAL_MAP_PREFILTER,
    MATERIAL_MAP_BRDF
}

enum ShaderLocationIndex
{
    SHADER_LOC_VERTEX_POSITION,
    SHADER_LOC_VERTEX_TEXCOORD01,
    SHADER_LOC_VERTEX_TEXCOORD02,
    SHADER_LOC_VERTEX_NORMAL,
    SHADER_LOC_VERTEX_TANGENT,
    SHADER_LOC_VERTEX_COLOR,
    SHADER_LOC_MATRIX_MVP,
    SHADER_LOC_MATRIX_VIEW,
    SHADER_LOC_MATRIX_PROJECTION,
    SHADER_LOC_MATRIX_MODEL,
    SHADER_LOC_MATRIX_NORMAL,
    SHADER_LOC_VECTOR_VIEW,
    SHADER_LOC_COLOR_DIFFUSE,
    SHADER_LOC_COLOR_SPECULAR,
    SHADER_LOC_COLOR_AMBIENT,
    SHADER_LOC_MAP_ALBEDO,
    SHADER_LOC_MAP_METALNESS,
    SHADER_LOC_MAP_NORMAL,
    SHADER_LOC_MAP_ROUGHNESS,
    SHADER_LOC_MAP_OCCLUSION,
    SHADER_LOC_MAP_EMISSION,
    SHADER_LOC_MAP_HEIGHT,
    SHADER_LOC_MAP_CUBEMAP,
    SHADER_LOC_MAP_IRRADIANCE,
    SHADER_LOC_MAP_PREFILTER,
    SHADER_LOC_MAP_BRDF,
    SHADER_LOC_VERTEX_BONEIDS,
    SHADER_LOC_VERTEX_BONEWEIGHTS,
    SHADER_LOC_MATRIX_BONETRANSFORMS,
    SHADER_LOC_VERTEX_INSTANCETRANSFORM
}

enum ShaderUniformDataType
{
    SHADER_UNIFORM_FLOAT,
    SHADER_UNIFORM_VEC2,
    SHADER_UNIFORM_VEC3,
    SHADER_UNIFORM_VEC4,
    SHADER_UNIFORM_INT,
    SHADER_UNIFORM_IVEC2,
    SHADER_UNIFORM_IVEC3,
    SHADER_UNIFORM_IVEC4,
    SHADER_UNIFORM_UINT,
    SHADER_UNIFORM_UIVEC2,
    SHADER_UNIFORM_UIVEC3,
    SHADER_UNIFORM_UIVEC4,
    SHADER_UNIFORM_SAMPLER2D
}

enum ShaderAttributeDataType
{
    SHADER_ATTRIB_FLOAT,
    SHADER_ATTRIB_VEC2,
    SHADER_ATTRIB_VEC3,
    SHADER_ATTRIB_VEC4
}

constdef PixelFormat : int
{
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2,
    PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4,
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5,
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7,
    PIXELFORMAT_UNCOMPRESSED_R32 = 8,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10,
    PIXELFORMAT_UNCOMPRESSED_R16 = 11,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13,
    PIXELFORMAT_COMPRESSED_DXT1_RGB = 14,
    PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15,
    PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16,
    PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17,
    PIXELFORMAT_COMPRESSED_ETC1_RGB = 18,
    PIXELFORMAT_COMPRESSED_ETC2_RGB = 19,
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20,
    PIXELFORMAT_COMPRESSED_PVRT_RGB = 21,
    PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22,
    PIXELFORMAT_COMPRESSED_ASTC_4X4_RGBA = 23,
    PIXELFORMAT_COMPRESSED_ASTC_8X8_RGBA = 24
}

enum TextureFilter
{
    TEXTURE_FILTER_POINT,
    TEXTURE_FILTER_BILINEAR,
    TEXTURE_FILTER_TRILINEAR,
    TEXTURE_FILTER_ANISOTROPIC_4X,
    TEXTURE_FILTER_ANISOTROPIC_8X,
    TEXTURE_FILTER_ANISOTROPIC_16X
}

enum TextureWrap
{
    TEXTURE_WRAP_REPEAT,
    TEXTURE_WRAP_CLAMP,
    TEXTURE_WRAP_MIRROR_REPEAT,
    TEXTURE_WRAP_MIRROR_CLAMP
}

enum CubemapLayout
{
    CUBEMAP_LAYOUT_AUTO_DETECT,
    CUBEMAP_LAYOUT_LINE_VERTICAL,
    CUBEMAP_LAYOUT_LINE_HORIZONTAL,
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE
}

enum FontType
{
    FONT_DEFAULT,
    FONT_BITMAP,
    FONT_SDF
}

enum BlendMode
{
    BLEND_ALPHA,
    BLEND_ADDITIVE,
    BLEND_MULTIPLIED,
    BLEND_ADD_COLORS,
    BLEND_SUBTRACT_COLORS,
    BLEND_ALPHA_PREMULTIPLY,
    BLEND_CUSTOM,
    BLEND_CUSTOM_SEPARATE
}

constdef Gesture : int
{
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512
}

enum CameraMode
{
    CAMERA_CUSTOM,
    CAMERA_FREE,
    CAMERA_ORBITAL,
    CAMERA_FIRST_PERSON,
    CAMERA_THIRD_PERSON
}

enum CameraProjection
{
    CAMERA_PERSPECTIVE,
    CAMERA_ORTHOGRAPHIC
}

enum NPatchLayout
{
    NPATCH_NINE_PATCH,
    NPATCH_THREE_PATCH_VERTICAL,
    NPATCH_THREE_PATCH_HORIZONTAL
}

struct Vector2
{
    float x;
    float y;
}

struct Vector3
{
    float x;
    float y;
    float z;
}

struct Vector4
{
    float x;
    float y;
    float z;
    float w;
}

struct Matrix
{
    float m0;
    float m4;
    float m8;
    float m12;
    float m1;
    float m5;
    float m9;
    float m13;
    float m2;
    float m6;
    float m10;
    float m14;
    float m3;
    float m7;
    float m11;
    float m15;
}

struct Color
{
    char r;
    char g;
    char b;
    char a;
}

struct Rectangle
{
    float x;
    float y;
    float width;
    float height;
}

struct Image
{
    void* data;
    int width;
    int height;
    int mipmaps;
    int format;
}

struct Texture
{
    uint id;
    int width;
    int height;
    int mipmaps;
    int format;
}

struct RenderTexture
{
    uint id;
    Texture texture;
    Texture depth;
}

struct NPatchInfo
{
    Rectangle source;
    int left;
    int top;
    int right;
    int bottom;
    int layout;
}

struct GlyphInfo
{
    int value;
    int offset_x;
    int offset_y;
    int advance_x;
    Image image;
}

struct Font
{
    int base_size;
    int glyph_count;
    int glyph_padding;
    Texture2D texture;
    Rectangle* recs;
    GlyphInfo* glyphs;
}

struct Camera3D
{
    Vector3 position;
    Vector3 target;
    Vector3 up;
    float fovy;
    int projection;
}

struct Camera2D
{
    Vector2 offset;
    Vector2 target;
    float rotation;
    float zoom;
}

struct Mesh
{
    int vertex_count;
    int triangle_count;
    float* vertices;
    float* texcoords;
    float* texcoords2;
    float* normals;
    float* tangents;
    char* colors;
    ushort* indices;
    int bone_count;
    char* bone_indices;
    float* bone_weights;
    float* anim_vertices;
    float* anim_normals;
    uint vao_id;
    uint* vbo_id;
}

struct Shader
{
    uint id;
    int* locs;
}

struct MaterialMap
{
    Texture2D texture;
    Color color;
    float value;
}

struct Material
{
    Shader shader;
    MaterialMap* maps;
    float[4] params;
}

struct Transform
{
    Vector3 translation;
    Quaternion rotation;
    Vector3 scale;
}

struct BoneInfo
{
    char[32] name;
    int parent;
}

struct ModelSkeleton
{
    int bone_count;
    BoneInfo* bones;
    ModelAnimPose bind_pose;
}

struct Model
{
    Matrix transform;
    int mesh_count;
    int material_count;
    Mesh* meshes;
    Material* materials;
    int* mesh_material;
    ModelSkeleton skeleton;
    ModelAnimPose current_pose;
    Matrix* bone_matrices;
}

struct ModelAnimation
{
    char[32] name;
    int bone_count;
    int keyframe_count;
    ModelAnimPose* keyframe_poses;
}

struct Ray
{
    Vector3 position;
    Vector3 direction;
}

struct RayCollision
{
    bool hit;
    float distance;
    Vector3 point;
    Vector3 normal;
}

struct BoundingBox
{
    Vector3 min;
    Vector3 max;
}

struct Wave
{
    uint frame_count;
    uint sample_rate;
    uint sample_size;
    uint channels;
    void* data;
}

struct RAudioBuffer
{
    void* _unused;
}

struct RAudioProcessor
{
    void* _unused;
}

struct AudioStream
{
    RAudioBuffer* buffer;
    RAudioProcessor* processor;
    uint sample_rate;
    uint sample_size;
    uint channels;
}

struct Sound
{
    AudioStream stream;
    uint frame_count;
}

struct Music
{
    AudioStream stream;
    uint frame_count;
    bool looping;
    int ctx_type;
    void* ctx_data;
}

struct VrDeviceInfo
{
    int h_resolution;
    int v_resolution;
    float h_screen_size;
    float v_screen_size;
    float eye_to_screen_distance;
    float lens_separation_distance;
    float interpupillary_distance;
    float[4] lens_distortion_values;
    float[4] chroma_ab_correction;
}

struct VrStereoConfig
{
    Matrix[2] projection;
    Matrix[2] view_offset;
    float[2] left_lens_center;
    float[2] right_lens_center;
    float[2] left_screen_center;
    float[2] right_screen_center;
    float[2] scale;
    float[2] scale_in;
}

struct FilePathList
{
    uint count;
    char** paths;
}

struct AutomationEvent
{
    uint frame;
    uint type;
    int[4] params;
}

struct AutomationEventList
{
    uint capacity;
    uint count;
    AutomationEvent* events;
}

// Functions
extern fn void init_window(int width, int height, ZString title) @cname("InitWindow");
extern fn void close_window() @cname("CloseWindow");
extern fn bool window_should_close() @cname("WindowShouldClose");
extern fn bool is_window_ready() @cname("IsWindowReady");
extern fn bool is_window_fullscreen() @cname("IsWindowFullscreen");
extern fn bool is_window_hidden() @cname("IsWindowHidden");
extern fn bool is_window_minimized() @cname("IsWindowMinimized");
extern fn bool is_window_maximized() @cname("IsWindowMaximized");
extern fn bool is_window_focused() @cname("IsWindowFocused");
extern fn bool is_window_resized() @cname("IsWindowResized");
extern fn bool is_window_state(uint flag) @cname("IsWindowState");
extern fn void set_window_state(uint flags) @cname("SetWindowState");
extern fn void clear_window_state(uint flags) @cname("ClearWindowState");
extern fn void toggle_fullscreen() @cname("ToggleFullscreen");
extern fn void toggle_borderless_windowed() @cname("ToggleBorderlessWindowed");
extern fn void maximize_window() @cname("MaximizeWindow");
extern fn void minimize_window() @cname("MinimizeWindow");
extern fn void restore_window() @cname("RestoreWindow");
extern fn void set_window_icon(Image image) @cname("SetWindowIcon");
extern fn void set_window_icons(Image* images, int count) @cname("SetWindowIcons");
extern fn void set_window_title(ZString title) @cname("SetWindowTitle");
extern fn void set_window_position(int x, int y) @cname("SetWindowPosition");
extern fn void set_window_monitor(int monitor) @cname("SetWindowMonitor");
extern fn void set_window_min_size(int width, int height) @cname("SetWindowMinSize");
extern fn void set_window_max_size(int width, int height) @cname("SetWindowMaxSize");
extern fn void set_window_size(int width, int height) @cname("SetWindowSize");
extern fn void set_window_opacity(float opacity) @cname("SetWindowOpacity");
extern fn void set_window_focused() @cname("SetWindowFocused");
extern fn void* get_window_handle() @cname("GetWindowHandle");
extern fn int get_screen_width() @cname("GetScreenWidth");
extern fn int get_screen_height() @cname("GetScreenHeight");
extern fn int get_render_width() @cname("GetRenderWidth");
extern fn int get_render_height() @cname("GetRenderHeight");
extern fn int get_monitor_count() @cname("GetMonitorCount");
extern fn int get_current_monitor() @cname("GetCurrentMonitor");
extern fn Vector2 get_monitor_position(int monitor) @cname("GetMonitorPosition");
extern fn int get_monitor_width(int monitor) @cname("GetMonitorWidth");
extern fn int get_monitor_height(int monitor) @cname("GetMonitorHeight");
extern fn int get_monitor_physical_width(int monitor) @cname("GetMonitorPhysicalWidth");
extern fn int get_monitor_physical_height(int monitor) @cname("GetMonitorPhysicalHeight");
extern fn int get_monitor_refresh_rate(int monitor) @cname("GetMonitorRefreshRate");
extern fn Vector2 get_window_position() @cname("GetWindowPosition");
extern fn Vector2 get_window_scale_dpi() @cname("GetWindowScaleDPI");
extern fn ZString get_monitor_name(int monitor) @cname("GetMonitorName");
extern fn void set_clipboard_text(ZString text) @cname("SetClipboardText");
extern fn ZString get_clipboard_text() @cname("GetClipboardText");
extern fn Image get_clipboard_image() @cname("GetClipboardImage");
extern fn void enable_event_waiting() @cname("EnableEventWaiting");
extern fn void disable_event_waiting() @cname("DisableEventWaiting");
extern fn void show_cursor() @cname("ShowCursor");
extern fn void hide_cursor() @cname("HideCursor");
extern fn bool is_cursor_hidden() @cname("IsCursorHidden");
extern fn void enable_cursor() @cname("EnableCursor");
extern fn void disable_cursor() @cname("DisableCursor");
extern fn bool is_cursor_on_screen() @cname("IsCursorOnScreen");
extern fn void clear_background(Color color) @cname("ClearBackground");
extern fn void begin_drawing() @cname("BeginDrawing");
extern fn void end_drawing() @cname("EndDrawing");
extern fn void begin_mode2d(Camera2D camera) @cname("BeginMode2D");
extern fn void end_mode2d() @cname("EndMode2D");
extern fn void begin_mode3d(Camera3D camera) @cname("BeginMode3D");
extern fn void end_mode3d() @cname("EndMode3D");
extern fn void begin_texture_mode(RenderTexture2D target) @cname("BeginTextureMode");
extern fn void end_texture_mode() @cname("EndTextureMode");
extern fn void begin_shader_mode(Shader shader) @cname("BeginShaderMode");
extern fn void end_shader_mode() @cname("EndShaderMode");
extern fn void begin_blend_mode(int mode) @cname("BeginBlendMode");
extern fn void end_blend_mode() @cname("EndBlendMode");
extern fn void begin_scissor_mode(int x, int y, int width, int height) @cname("BeginScissorMode");
extern fn void end_scissor_mode() @cname("EndScissorMode");
extern fn void begin_vr_stereo_mode(VrStereoConfig config) @cname("BeginVrStereoMode");
extern fn void end_vr_stereo_mode() @cname("EndVrStereoMode");
extern fn VrStereoConfig load_vr_stereo_config(VrDeviceInfo device) @cname("LoadVrStereoConfig");
extern fn void unload_vr_stereo_config(VrStereoConfig config) @cname("UnloadVrStereoConfig");
extern fn Shader load_shader(ZString vs_file_name, ZString fs_file_name) @cname("LoadShader");
extern fn Shader load_shader_from_memory(ZString vs_code, ZString fs_code) @cname("LoadShaderFromMemory");
extern fn bool is_shader_valid(Shader shader) @cname("IsShaderValid");
extern fn int get_shader_location(Shader shader, ZString uniform_name) @cname("GetShaderLocation");
extern fn int get_shader_location_attrib(Shader shader, ZString attrib_name) @cname("GetShaderLocationAttrib");
extern fn void set_shader_value(Shader shader, int loc_index, void* value, int uniform_type) @cname("SetShaderValue");
extern fn void set_shader_value_v(Shader shader, int loc_index, void* value, int uniform_type, int count) @cname("SetShaderValueV");
extern fn void set_shader_value_matrix(Shader shader, int loc_index, Matrix mat) @cname("SetShaderValueMatrix");
extern fn void set_shader_value_texture(Shader shader, int loc_index, Texture2D texture) @cname("SetShaderValueTexture");
extern fn void unload_shader(Shader shader) @cname("UnloadShader");
extern fn Ray get_screen_to_world_ray(Vector2 position, Camera camera) @cname("GetScreenToWorldRay");
extern fn Ray get_screen_to_world_ray_ex(Vector2 position, Camera camera, int width, int height) @cname("GetScreenToWorldRayEx");
extern fn Vector2 get_world_to_screen(Vector3 position, Camera camera) @cname("GetWorldToScreen");
extern fn Vector2 get_world_to_screen_ex(Vector3 position, Camera camera, int width, int height) @cname("GetWorldToScreenEx");
extern fn Vector2 get_world_to_screen2d(Vector2 position, Camera2D camera) @cname("GetWorldToScreen2D");
extern fn Vector2 get_screen_to_world2d(Vector2 position, Camera2D camera) @cname("GetScreenToWorld2D");
extern fn Matrix get_camera_matrix(Camera camera) @cname("GetCameraMatrix");
extern fn Matrix get_camera_matrix2d(Camera2D camera) @cname("GetCameraMatrix2D");
extern fn void set_target_fps(int fps) @cname("SetTargetFPS");
extern fn float get_frame_time() @cname("GetFrameTime");
extern fn double get_time() @cname("GetTime");
extern fn int get_fps() @cname("GetFPS");
extern fn void swap_screen_buffer() @cname("SwapScreenBuffer");
extern fn void poll_input_events() @cname("PollInputEvents");
extern fn void wait_time(double seconds) @cname("WaitTime");
extern fn void set_random_seed(uint seed) @cname("SetRandomSeed");
extern fn int get_random_value(int min, int max) @cname("GetRandomValue");
extern fn int* load_random_sequence(uint count, int min, int max) @cname("LoadRandomSequence");
extern fn void unload_random_sequence(int* sequence) @cname("UnloadRandomSequence");
extern fn void take_screenshot(ZString file_name) @cname("TakeScreenshot");
extern fn void set_config_flags(uint flags) @cname("SetConfigFlags");
extern fn void open_url(ZString url) @cname("OpenURL");
extern fn void set_trace_log_level(int log_level) @cname("SetTraceLogLevel");
extern fn void trace_log(int log_level, ZString text, ...) @cname("TraceLog");
extern fn void set_trace_log_callback(TraceLogCallback callback) @cname("SetTraceLogCallback");
extern fn void* mem_alloc(uint size) @cname("MemAlloc");
extern fn void* mem_realloc(void* ptr, uint size) @cname("MemRealloc");
extern fn void mem_free(void* ptr) @cname("MemFree");
extern fn char* load_file_data(ZString file_name, int* data_size) @cname("LoadFileData");
extern fn void unload_file_data(char* data) @cname("UnloadFileData");
extern fn bool save_file_data(ZString file_name, void* data, int data_size) @cname("SaveFileData");
extern fn bool export_data_as_code(ZString data, int data_size, ZString file_name) @cname("ExportDataAsCode");
extern fn char* load_file_text(ZString file_name) @cname("LoadFileText");
extern fn void unload_file_text(char* text) @cname("UnloadFileText");
extern fn bool save_file_text(ZString file_name, ZString text) @cname("SaveFileText");
extern fn void set_load_file_data_callback(LoadFileDataCallback callback) @cname("SetLoadFileDataCallback");
extern fn void set_save_file_data_callback(SaveFileDataCallback callback) @cname("SetSaveFileDataCallback");
extern fn void set_load_file_text_callback(LoadFileTextCallback callback) @cname("SetLoadFileTextCallback");
extern fn void set_save_file_text_callback(SaveFileTextCallback callback) @cname("SetSaveFileTextCallback");
extern fn int file_rename(ZString file_name, ZString file_rename) @cname("FileRename");
extern fn int file_remove(ZString file_name) @cname("FileRemove");
extern fn int file_copy(ZString src_path, ZString dst_path) @cname("FileCopy");
extern fn int file_move(ZString src_path, ZString dst_path) @cname("FileMove");
extern fn int file_text_replace(ZString file_name, ZString search, ZString replacement) @cname("FileTextReplace");
extern fn int file_text_find_index(ZString file_name, ZString search) @cname("FileTextFindIndex");
extern fn bool file_exists(ZString file_name) @cname("FileExists");
extern fn bool directory_exists(ZString dir_path) @cname("DirectoryExists");
extern fn bool is_file_extension(ZString file_name, ZString ext) @cname("IsFileExtension");
extern fn int get_file_length(ZString file_name) @cname("GetFileLength");
extern fn CLong get_file_mod_time(ZString file_name) @cname("GetFileModTime");
extern fn ZString get_file_extension(ZString file_name) @cname("GetFileExtension");
extern fn ZString get_file_name(ZString file_path) @cname("GetFileName");
extern fn ZString get_file_name_without_ext(ZString file_path) @cname("GetFileNameWithoutExt");
extern fn ZString get_directory_path(ZString file_path) @cname("GetDirectoryPath");
extern fn ZString get_prev_directory_path(ZString dir_path) @cname("GetPrevDirectoryPath");
extern fn ZString get_working_directory() @cname("GetWorkingDirectory");
extern fn ZString get_application_directory() @cname("GetApplicationDirectory");
extern fn int make_directory(ZString dir_path) @cname("MakeDirectory");
extern fn bool change_directory(ZString dir_path) @cname("ChangeDirectory");
extern fn bool is_path_file(ZString path) @cname("IsPathFile");
extern fn bool is_file_name_valid(ZString file_name) @cname("IsFileNameValid");
extern fn FilePathList load_directory_files(ZString dir_path) @cname("LoadDirectoryFiles");
extern fn FilePathList load_directory_files_ex(ZString base_path, ZString filter, bool scan_subdirs) @cname("LoadDirectoryFilesEx");
extern fn void unload_directory_files(FilePathList files) @cname("UnloadDirectoryFiles");
extern fn bool is_file_dropped() @cname("IsFileDropped");
extern fn FilePathList load_dropped_files() @cname("LoadDroppedFiles");
extern fn void unload_dropped_files(FilePathList files) @cname("UnloadDroppedFiles");
extern fn uint get_directory_file_count(ZString dir_path) @cname("GetDirectoryFileCount");
extern fn uint get_directory_file_count_ex(ZString base_path, ZString filter, bool scan_subdirs) @cname("GetDirectoryFileCountEx");
extern fn char* compress_data(ZString data, int data_size, int* comp_data_size) @cname("CompressData");
extern fn char* decompress_data(ZString comp_data, int comp_data_size, int* data_size) @cname("DecompressData");
extern fn char* encode_data_base64(ZString data, int data_size, int* output_size) @cname("EncodeDataBase64");
extern fn char* decode_data_base64(ZString text, int* output_size) @cname("DecodeDataBase64");
extern fn uint compute_crc32(char* data, int data_size) @cname("ComputeCRC32");
extern fn uint* compute_md5(char* data, int data_size) @cname("ComputeMD5");
extern fn uint* compute_sha1(char* data, int data_size) @cname("ComputeSHA1");
extern fn uint* compute_sha256(char* data, int data_size) @cname("ComputeSHA256");
extern fn AutomationEventList load_automation_event_list(ZString file_name) @cname("LoadAutomationEventList");
extern fn void unload_automation_event_list(AutomationEventList list) @cname("UnloadAutomationEventList");
extern fn bool export_automation_event_list(AutomationEventList list, ZString file_name) @cname("ExportAutomationEventList");
extern fn void set_automation_event_list(AutomationEventList* list) @cname("SetAutomationEventList");
extern fn void set_automation_event_base_frame(int frame) @cname("SetAutomationEventBaseFrame");
extern fn void start_automation_event_recording() @cname("StartAutomationEventRecording");
extern fn void stop_automation_event_recording() @cname("StopAutomationEventRecording");
extern fn void play_automation_event(AutomationEvent event) @cname("PlayAutomationEvent");
extern fn bool is_key_pressed(int key) @cname("IsKeyPressed");
extern fn bool is_key_pressed_repeat(int key) @cname("IsKeyPressedRepeat");
extern fn bool is_key_down(int key) @cname("IsKeyDown");
extern fn bool is_key_released(int key) @cname("IsKeyReleased");
extern fn bool is_key_up(int key) @cname("IsKeyUp");
extern fn int get_key_pressed() @cname("GetKeyPressed");
extern fn int get_char_pressed() @cname("GetCharPressed");
extern fn ZString get_key_name(int key) @cname("GetKeyName");
extern fn void set_exit_key(int key) @cname("SetExitKey");
extern fn bool is_gamepad_available(int gamepad) @cname("IsGamepadAvailable");
extern fn ZString get_gamepad_name(int gamepad) @cname("GetGamepadName");
extern fn bool is_gamepad_button_pressed(int gamepad, int button) @cname("IsGamepadButtonPressed");
extern fn bool is_gamepad_button_down(int gamepad, int button) @cname("IsGamepadButtonDown");
extern fn bool is_gamepad_button_released(int gamepad, int button) @cname("IsGamepadButtonReleased");
extern fn bool is_gamepad_button_up(int gamepad, int button) @cname("IsGamepadButtonUp");
extern fn int get_gamepad_button_pressed() @cname("GetGamepadButtonPressed");
extern fn int get_gamepad_axis_count(int gamepad) @cname("GetGamepadAxisCount");
extern fn float get_gamepad_axis_movement(int gamepad, int axis) @cname("GetGamepadAxisMovement");
extern fn int set_gamepad_mappings(ZString mappings) @cname("SetGamepadMappings");
extern fn void set_gamepad_vibration(int gamepad, float left_motor, float right_motor, float duration) @cname("SetGamepadVibration");
extern fn bool is_mouse_button_pressed(int button) @cname("IsMouseButtonPressed");
extern fn bool is_mouse_button_down(int button) @cname("IsMouseButtonDown");
extern fn bool is_mouse_button_released(int button) @cname("IsMouseButtonReleased");
extern fn bool is_mouse_button_up(int button) @cname("IsMouseButtonUp");
extern fn int get_mouse_x() @cname("GetMouseX");
extern fn int get_mouse_y() @cname("GetMouseY");
extern fn Vector2 get_mouse_position() @cname("GetMousePosition");
extern fn Vector2 get_mouse_delta() @cname("GetMouseDelta");
extern fn void set_mouse_position(int x, int y) @cname("SetMousePosition");
extern fn void set_mouse_offset(int offset_x, int offset_y) @cname("SetMouseOffset");
extern fn void set_mouse_scale(float scale_x, float scale_y) @cname("SetMouseScale");
extern fn float get_mouse_wheel_move() @cname("GetMouseWheelMove");
extern fn Vector2 get_mouse_wheel_move_v() @cname("GetMouseWheelMoveV");
extern fn void set_mouse_cursor(int cursor) @cname("SetMouseCursor");
extern fn int get_touch_x() @cname("GetTouchX");
extern fn int get_touch_y() @cname("GetTouchY");
extern fn Vector2 get_touch_position(int index) @cname("GetTouchPosition");
extern fn int get_touch_point_id(int index) @cname("GetTouchPointId");
extern fn int get_touch_point_count() @cname("GetTouchPointCount");
extern fn void set_gestures_enabled(uint flags) @cname("SetGesturesEnabled");
extern fn bool is_gesture_detected(uint gesture) @cname("IsGestureDetected");
extern fn int get_gesture_detected() @cname("GetGestureDetected");
extern fn float get_gesture_hold_duration() @cname("GetGestureHoldDuration");
extern fn Vector2 get_gesture_drag_vector() @cname("GetGestureDragVector");
extern fn float get_gesture_drag_angle() @cname("GetGestureDragAngle");
extern fn Vector2 get_gesture_pinch_vector() @cname("GetGesturePinchVector");
extern fn float get_gesture_pinch_angle() @cname("GetGesturePinchAngle");
extern fn void update_camera(Camera* camera, int mode) @cname("UpdateCamera");
extern fn void update_camera_pro(Camera* camera, Vector3 movement, Vector3 rotation, float zoom) @cname("UpdateCameraPro");
extern fn void set_shapes_texture(Texture2D texture, Rectangle source) @cname("SetShapesTexture");
extern fn Texture2D get_shapes_texture() @cname("GetShapesTexture");
extern fn Rectangle get_shapes_texture_rectangle() @cname("GetShapesTextureRectangle");
extern fn void draw_pixel(int pos_x, int pos_y, Color color) @cname("DrawPixel");
extern fn void draw_pixel_v(Vector2 position, Color color) @cname("DrawPixelV");
extern fn void draw_line(int start_pos_x, int start_pos_y, int end_pos_x, int end_pos_y, Color color) @cname("DrawLine");
extern fn void draw_line_v(Vector2 start_pos, Vector2 end_pos, Color color) @cname("DrawLineV");
extern fn void draw_line_ex(Vector2 start_pos, Vector2 end_pos, float thick, Color color) @cname("DrawLineEx");
extern fn void draw_line_strip(Vector2* points, int point_count, Color color) @cname("DrawLineStrip");
extern fn void draw_line_bezier(Vector2 start_pos, Vector2 end_pos, float thick, Color color) @cname("DrawLineBezier");
extern fn void draw_line_dashed(Vector2 start_pos, Vector2 end_pos, int dash_size, int space_size, Color color) @cname("DrawLineDashed");
extern fn void draw_circle(int center_x, int center_y, float radius, Color color) @cname("DrawCircle");
extern fn void draw_circle_v(Vector2 center, float radius, Color color) @cname("DrawCircleV");
extern fn void draw_circle_gradient(Vector2 center, float radius, Color inner, Color outer) @cname("DrawCircleGradient");
extern fn void draw_circle_sector(Vector2 center, float radius, float start_angle, float end_angle, int segments, Color color) @cname("DrawCircleSector");
extern fn void draw_circle_sector_lines(Vector2 center, float radius, float start_angle, float end_angle, int segments, Color color) @cname("DrawCircleSectorLines");
extern fn void draw_circle_lines(int center_x, int center_y, float radius, Color color) @cname("DrawCircleLines");
extern fn void draw_circle_lines_v(Vector2 center, float radius, Color color) @cname("DrawCircleLinesV");
extern fn void draw_ellipse(int center_x, int center_y, float radius_h, float radius_v, Color color) @cname("DrawEllipse");
extern fn void draw_ellipse_v(Vector2 center, float radius_h, float radius_v, Color color) @cname("DrawEllipseV");
extern fn void draw_ellipse_lines(int center_x, int center_y, float radius_h, float radius_v, Color color) @cname("DrawEllipseLines");
extern fn void draw_ellipse_lines_v(Vector2 center, float radius_h, float radius_v, Color color) @cname("DrawEllipseLinesV");
extern fn void draw_ring(Vector2 center, float inner_radius, float outer_radius, float start_angle, float end_angle, int segments, Color color) @cname("DrawRing");
extern fn void draw_ring_lines(Vector2 center, float inner_radius, float outer_radius, float start_angle, float end_angle, int segments, Color color) @cname("DrawRingLines");
extern fn void draw_rectangle(int pos_x, int pos_y, int width, int height, Color color) @cname("DrawRectangle");
extern fn void draw_rectangle_v(Vector2 position, Vector2 size, Color color) @cname("DrawRectangleV");
extern fn void draw_rectangle_rec(Rectangle rec, Color color) @cname("DrawRectangleRec");
extern fn void draw_rectangle_pro(Rectangle rec, Vector2 origin, float rotation, Color color) @cname("DrawRectanglePro");
extern fn void draw_rectangle_gradient_v(int pos_x, int pos_y, int width, int height, Color top, Color bottom) @cname("DrawRectangleGradientV");
extern fn void draw_rectangle_gradient_h(int pos_x, int pos_y, int width, int height, Color left, Color right) @cname("DrawRectangleGradientH");
extern fn void draw_rectangle_gradient_ex(Rectangle rec, Color top_left, Color bottom_left, Color bottom_right, Color top_right) @cname("DrawRectangleGradientEx");
extern fn void draw_rectangle_lines(int pos_x, int pos_y, int width, int height, Color color) @cname("DrawRectangleLines");
extern fn void draw_rectangle_lines_ex(Rectangle rec, float line_thick, Color color) @cname("DrawRectangleLinesEx");
extern fn void draw_rectangle_rounded(Rectangle rec, float roundness, int segments, Color color) @cname("DrawRectangleRounded");
extern fn void draw_rectangle_rounded_lines(Rectangle rec, float roundness, int segments, Color color) @cname("DrawRectangleRoundedLines");
extern fn void draw_rectangle_rounded_lines_ex(Rectangle rec, float roundness, int segments, float line_thick, Color color) @cname("DrawRectangleRoundedLinesEx");
extern fn void draw_triangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color) @cname("DrawTriangle");
extern fn void draw_triangle_lines(Vector2 v1, Vector2 v2, Vector2 v3, Color color) @cname("DrawTriangleLines");
extern fn void draw_triangle_fan(Vector2* points, int point_count, Color color) @cname("DrawTriangleFan");
extern fn void draw_triangle_strip(Vector2* points, int point_count, Color color) @cname("DrawTriangleStrip");
extern fn void draw_poly(Vector2 center, int sides, float radius, float rotation, Color color) @cname("DrawPoly");
extern fn void draw_poly_lines(Vector2 center, int sides, float radius, float rotation, Color color) @cname("DrawPolyLines");
extern fn void draw_poly_lines_ex(Vector2 center, int sides, float radius, float rotation, float line_thick, Color color) @cname("DrawPolyLinesEx");
extern fn void draw_spline_linear(Vector2* points, int point_count, float thick, Color color) @cname("DrawSplineLinear");
extern fn void draw_spline_basis(Vector2* points, int point_count, float thick, Color color) @cname("DrawSplineBasis");
extern fn void draw_spline_catmull_rom(Vector2* points, int point_count, float thick, Color color) @cname("DrawSplineCatmullRom");
extern fn void draw_spline_bezier_quadratic(Vector2* points, int point_count, float thick, Color color) @cname("DrawSplineBezierQuadratic");
extern fn void draw_spline_bezier_cubic(Vector2* points, int point_count, float thick, Color color) @cname("DrawSplineBezierCubic");
extern fn void draw_spline_segment_linear(Vector2 p1, Vector2 p2, float thick, Color color) @cname("DrawSplineSegmentLinear");
extern fn void draw_spline_segment_basis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) @cname("DrawSplineSegmentBasis");
extern fn void draw_spline_segment_catmull_rom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) @cname("DrawSplineSegmentCatmullRom");
extern fn void draw_spline_segment_bezier_quadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color) @cname("DrawSplineSegmentBezierQuadratic");
extern fn void draw_spline_segment_bezier_cubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color) @cname("DrawSplineSegmentBezierCubic");
extern fn Vector2 get_spline_point_linear(Vector2 start_pos, Vector2 end_pos, float t) @cname("GetSplinePointLinear");
extern fn Vector2 get_spline_point_basis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t) @cname("GetSplinePointBasis");
extern fn Vector2 get_spline_point_catmull_rom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t) @cname("GetSplinePointCatmullRom");
extern fn Vector2 get_spline_point_bezier_quad(Vector2 p1, Vector2 c2, Vector2 p3, float t) @cname("GetSplinePointBezierQuad");
extern fn Vector2 get_spline_point_bezier_cubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t) @cname("GetSplinePointBezierCubic");
extern fn bool check_collision_recs(Rectangle rec1, Rectangle rec2) @cname("CheckCollisionRecs");
extern fn bool check_collision_circles(Vector2 center1, float radius1, Vector2 center2, float radius2) @cname("CheckCollisionCircles");
extern fn bool check_collision_circle_rec(Vector2 center, float radius, Rectangle rec) @cname("CheckCollisionCircleRec");
extern fn bool check_collision_circle_line(Vector2 center, float radius, Vector2 p1, Vector2 p2) @cname("CheckCollisionCircleLine");
extern fn bool check_collision_point_rec(Vector2 point, Rectangle rec) @cname("CheckCollisionPointRec");
extern fn bool check_collision_point_circle(Vector2 point, Vector2 center, float radius) @cname("CheckCollisionPointCircle");
extern fn bool check_collision_point_triangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3) @cname("CheckCollisionPointTriangle");
extern fn bool check_collision_point_line(Vector2 point, Vector2 p1, Vector2 p2, int threshold) @cname("CheckCollisionPointLine");
extern fn bool check_collision_point_poly(Vector2 point, Vector2* points, int point_count) @cname("CheckCollisionPointPoly");
extern fn bool check_collision_lines(Vector2 start_pos1, Vector2 end_pos1, Vector2 start_pos2, Vector2 end_pos2, Vector2* collision_point) @cname("CheckCollisionLines");
extern fn Rectangle get_collision_rec(Rectangle rec1, Rectangle rec2) @cname("GetCollisionRec");
extern fn Image load_image(ZString file_name) @cname("LoadImage");
extern fn Image load_image_raw(ZString file_name, int width, int height, int format, int header_size) @cname("LoadImageRaw");
extern fn Image load_image_anim(ZString file_name, int* frames) @cname("LoadImageAnim");
extern fn Image load_image_anim_from_memory(ZString file_type, ZString file_data, int data_size, int* frames) @cname("LoadImageAnimFromMemory");
extern fn Image load_image_from_memory(ZString file_type, ZString file_data, int data_size) @cname("LoadImageFromMemory");
extern fn Image load_image_from_texture(Texture2D texture) @cname("LoadImageFromTexture");
extern fn Image load_image_from_screen() @cname("LoadImageFromScreen");
extern fn bool is_image_valid(Image image) @cname("IsImageValid");
extern fn void unload_image(Image image) @cname("UnloadImage");
extern fn bool export_image(Image image, ZString file_name) @cname("ExportImage");
extern fn char* export_image_to_memory(Image image, ZString file_type, int* file_size) @cname("ExportImageToMemory");
extern fn bool export_image_as_code(Image image, ZString file_name) @cname("ExportImageAsCode");
extern fn Image gen_image_color(int width, int height, Color color) @cname("GenImageColor");
extern fn Image gen_image_gradient_linear(int width, int height, int direction, Color start, Color end) @cname("GenImageGradientLinear");
extern fn Image gen_image_gradient_radial(int width, int height, float density, Color inner, Color outer) @cname("GenImageGradientRadial");
extern fn Image gen_image_gradient_square(int width, int height, float density, Color inner, Color outer) @cname("GenImageGradientSquare");
extern fn Image gen_image_checked(int width, int height, int checks_x, int checks_y, Color col1, Color col2) @cname("GenImageChecked");
extern fn Image gen_image_white_noise(int width, int height, float factor) @cname("GenImageWhiteNoise");
extern fn Image gen_image_perlin_noise(int width, int height, int offset_x, int offset_y, float scale) @cname("GenImagePerlinNoise");
extern fn Image gen_image_cellular(int width, int height, int tile_size) @cname("GenImageCellular");
extern fn Image gen_image_text(int width, int height, ZString text) @cname("GenImageText");
extern fn Image image_copy(Image image) @cname("ImageCopy");
extern fn Image image_from_image(Image image, Rectangle rec) @cname("ImageFromImage");
extern fn Image image_from_channel(Image image, int selected_channel) @cname("ImageFromChannel");
extern fn Image image_text(ZString text, int font_size, Color color) @cname("ImageText");
extern fn Image image_text_ex(Font font, ZString text, float font_size, float spacing, Color tint) @cname("ImageTextEx");
extern fn void image_format(Image* image, int new_format) @cname("ImageFormat");
extern fn void image_to_pot(Image* image, Color fill) @cname("ImageToPOT");
extern fn void image_crop(Image* image, Rectangle crop) @cname("ImageCrop");
extern fn void image_alpha_crop(Image* image, float threshold) @cname("ImageAlphaCrop");
extern fn void image_alpha_clear(Image* image, Color color, float threshold) @cname("ImageAlphaClear");
extern fn void image_alpha_mask(Image* image, Image alpha_mask) @cname("ImageAlphaMask");
extern fn void image_alpha_premultiply(Image* image) @cname("ImageAlphaPremultiply");
extern fn void image_blur_gaussian(Image* image, int blur_size) @cname("ImageBlurGaussian");
extern fn void image_kernel_convolution(Image* image, float* kernel, int kernel_size) @cname("ImageKernelConvolution");
extern fn void image_resize(Image* image, int new_width, int new_height) @cname("ImageResize");
extern fn void image_resize_nn(Image* image, int new_width, int new_height) @cname("ImageResizeNN");
extern fn void image_resize_canvas(Image* image, int new_width, int new_height, int offset_x, int offset_y, Color fill) @cname("ImageResizeCanvas");
extern fn void image_mipmaps(Image* image) @cname("ImageMipmaps");
extern fn void image_dither(Image* image, int r_bpp, int g_bpp, int b_bpp, int a_bpp) @cname("ImageDither");
extern fn void image_flip_vertical(Image* image) @cname("ImageFlipVertical");
extern fn void image_flip_horizontal(Image* image) @cname("ImageFlipHorizontal");
extern fn void image_rotate(Image* image, int degrees) @cname("ImageRotate");
extern fn void image_rotate_cw(Image* image) @cname("ImageRotateCW");
extern fn void image_rotate_ccw(Image* image) @cname("ImageRotateCCW");
extern fn void image_color_tint(Image* image, Color color) @cname("ImageColorTint");
extern fn void image_color_invert(Image* image) @cname("ImageColorInvert");
extern fn void image_color_grayscale(Image* image) @cname("ImageColorGrayscale");
extern fn void image_color_contrast(Image* image, float contrast) @cname("ImageColorContrast");
extern fn void image_color_brightness(Image* image, int brightness) @cname("ImageColorBrightness");
extern fn void image_color_replace(Image* image, Color color, Color replace) @cname("ImageColorReplace");
extern fn Color* load_image_colors(Image image) @cname("LoadImageColors");
extern fn Color* load_image_palette(Image image, int max_palette_size, int* color_count) @cname("LoadImagePalette");
extern fn void unload_image_colors(Color* colors) @cname("UnloadImageColors");
extern fn void unload_image_palette(Color* colors) @cname("UnloadImagePalette");
extern fn Rectangle get_image_alpha_border(Image image, float threshold) @cname("GetImageAlphaBorder");
extern fn Color get_image_color(Image image, int x, int y) @cname("GetImageColor");
extern fn void image_clear_background(Image* dst, Color color) @cname("ImageClearBackground");
extern fn void image_draw_pixel(Image* dst, int pos_x, int pos_y, Color color) @cname("ImageDrawPixel");
extern fn void image_draw_pixel_v(Image* dst, Vector2 position, Color color) @cname("ImageDrawPixelV");
extern fn void image_draw_line(Image* dst, int start_pos_x, int start_pos_y, int end_pos_x, int end_pos_y, Color color) @cname("ImageDrawLine");
extern fn void image_draw_line_v(Image* dst, Vector2 start, Vector2 end, Color color) @cname("ImageDrawLineV");
extern fn void image_draw_line_ex(Image* dst, Vector2 start, Vector2 end, int thick, Color color) @cname("ImageDrawLineEx");
extern fn void image_draw_circle(Image* dst, int center_x, int center_y, int radius, Color color) @cname("ImageDrawCircle");
extern fn void image_draw_circle_v(Image* dst, Vector2 center, int radius, Color color) @cname("ImageDrawCircleV");
extern fn void image_draw_circle_lines(Image* dst, int center_x, int center_y, int radius, Color color) @cname("ImageDrawCircleLines");
extern fn void image_draw_circle_lines_v(Image* dst, Vector2 center, int radius, Color color) @cname("ImageDrawCircleLinesV");
extern fn void image_draw_rectangle(Image* dst, int pos_x, int pos_y, int width, int height, Color color) @cname("ImageDrawRectangle");
extern fn void image_draw_rectangle_v(Image* dst, Vector2 position, Vector2 size, Color color) @cname("ImageDrawRectangleV");
extern fn void image_draw_rectangle_rec(Image* dst, Rectangle rec, Color color) @cname("ImageDrawRectangleRec");
extern fn void image_draw_rectangle_lines(Image* dst, Rectangle rec, int thick, Color color) @cname("ImageDrawRectangleLines");
extern fn void image_draw_triangle(Image* dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color) @cname("ImageDrawTriangle");
extern fn void image_draw_triangle_ex(Image* dst, Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3) @cname("ImageDrawTriangleEx");
extern fn void image_draw_triangle_lines(Image* dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color) @cname("ImageDrawTriangleLines");
extern fn void image_draw_triangle_fan(Image* dst, Vector2* points, int point_count, Color color) @cname("ImageDrawTriangleFan");
extern fn void image_draw_triangle_strip(Image* dst, Vector2* points, int point_count, Color color) @cname("ImageDrawTriangleStrip");
extern fn void image_draw(Image* dst, Image src, Rectangle src_rec, Rectangle dst_rec, Color tint) @cname("ImageDraw");
extern fn void image_draw_text(Image* dst, ZString text, int pos_x, int pos_y, int font_size, Color color) @cname("ImageDrawText");
extern fn void image_draw_text_ex(Image* dst, Font font, ZString text, Vector2 position, float font_size, float spacing, Color tint) @cname("ImageDrawTextEx");
extern fn Texture2D load_texture(ZString file_name) @cname("LoadTexture");
extern fn Texture2D load_texture_from_image(Image image) @cname("LoadTextureFromImage");
extern fn TextureCubemap load_texture_cubemap(Image image, int layout) @cname("LoadTextureCubemap");
extern fn RenderTexture2D load_render_texture(int width, int height) @cname("LoadRenderTexture");
extern fn bool is_texture_valid(Texture2D texture) @cname("IsTextureValid");
extern fn void unload_texture(Texture2D texture) @cname("UnloadTexture");
extern fn bool is_render_texture_valid(RenderTexture2D target) @cname("IsRenderTextureValid");
extern fn void unload_render_texture(RenderTexture2D target) @cname("UnloadRenderTexture");
extern fn void update_texture(Texture2D texture, void* pixels) @cname("UpdateTexture");
extern fn void update_texture_rec(Texture2D texture, Rectangle rec, void* pixels) @cname("UpdateTextureRec");
extern fn void gen_texture_mipmaps(Texture2D* texture) @cname("GenTextureMipmaps");
extern fn void set_texture_filter(Texture2D texture, int filter) @cname("SetTextureFilter");
extern fn void set_texture_wrap(Texture2D texture, int wrap) @cname("SetTextureWrap");
extern fn void draw_texture(Texture2D texture, int pos_x, int pos_y, Color tint) @cname("DrawTexture");
extern fn void draw_texture_v(Texture2D texture, Vector2 position, Color tint) @cname("DrawTextureV");
extern fn void draw_texture_ex(Texture2D texture, Vector2 position, float rotation, float scale, Color tint) @cname("DrawTextureEx");
extern fn void draw_texture_rec(Texture2D texture, Rectangle source, Vector2 position, Color tint) @cname("DrawTextureRec");
extern fn void draw_texture_pro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint) @cname("DrawTexturePro");
extern fn void draw_texture_n_patch(Texture2D texture, NPatchInfo n_patch_info, Rectangle dest, Vector2 origin, float rotation, Color tint) @cname("DrawTextureNPatch");
extern fn bool color_is_equal(Color col1, Color col2) @cname("ColorIsEqual");
extern fn Color fade(Color color, float alpha) @cname("Fade");
extern fn int color_to_int(Color color) @cname("ColorToInt");
extern fn Vector4 color_normalize(Color color) @cname("ColorNormalize");
extern fn Color color_from_normalized(Vector4 normalized) @cname("ColorFromNormalized");
extern fn Vector3 color_to_hsv(Color color) @cname("ColorToHSV");
extern fn Color color_from_hsv(float hue, float saturation, float value) @cname("ColorFromHSV");
extern fn Color color_tint(Color color, Color tint) @cname("ColorTint");
extern fn Color color_brightness(Color color, float factor) @cname("ColorBrightness");
extern fn Color color_contrast(Color color, float contrast) @cname("ColorContrast");
extern fn Color color_alpha(Color color, float alpha) @cname("ColorAlpha");
extern fn Color color_alpha_blend(Color dst, Color src, Color tint) @cname("ColorAlphaBlend");
extern fn Color color_lerp(Color color1, Color color2, float factor) @cname("ColorLerp");
extern fn Color get_color(uint hex_value) @cname("GetColor");
extern fn Color get_pixel_color(void* src_ptr, int format) @cname("GetPixelColor");
extern fn void set_pixel_color(void* dst_ptr, Color color, int format) @cname("SetPixelColor");
extern fn int get_pixel_data_size(int width, int height, int format) @cname("GetPixelDataSize");
extern fn Font get_font_default() @cname("GetFontDefault");
extern fn Font load_font(ZString file_name) @cname("LoadFont");
extern fn Font load_font_ex(ZString file_name, int font_size, int* codepoints, int codepoint_count) @cname("LoadFontEx");
extern fn Font load_font_from_image(Image image, Color key, int first_char) @cname("LoadFontFromImage");
extern fn Font load_font_from_memory(ZString file_type, ZString file_data, int data_size, int font_size, int* codepoints, int codepoint_count) @cname("LoadFontFromMemory");
extern fn bool is_font_valid(Font font) @cname("IsFontValid");
extern fn GlyphInfo* load_font_data(ZString file_data, int data_size, int font_size, int* codepoints, int codepoint_count, int type, int* glyph_count) @cname("LoadFontData");
extern fn Image gen_image_font_atlas(GlyphInfo* glyphs, Rectangle** glyph_recs, int glyph_count, int font_size, int padding, int pack_method) @cname("GenImageFontAtlas");
extern fn void unload_font_data(GlyphInfo* glyphs, int glyph_count) @cname("UnloadFontData");
extern fn void unload_font(Font font) @cname("UnloadFont");
extern fn bool export_font_as_code(Font font, ZString file_name) @cname("ExportFontAsCode");
extern fn void draw_fps(int pos_x, int pos_y) @cname("DrawFPS");
extern fn void draw_text(ZString text, int pos_x, int pos_y, int font_size, Color color) @cname("DrawText");
extern fn void draw_text_ex(Font font, ZString text, Vector2 position, float font_size, float spacing, Color tint) @cname("DrawTextEx");
extern fn void draw_text_pro(Font font, ZString text, Vector2 position, Vector2 origin, float rotation, float font_size, float spacing, Color tint) @cname("DrawTextPro");
extern fn void draw_text_codepoint(Font font, int codepoint, Vector2 position, float font_size, Color tint) @cname("DrawTextCodepoint");
extern fn void draw_text_codepoints(Font font, int* codepoints, int codepoint_count, Vector2 position, float font_size, float spacing, Color tint) @cname("DrawTextCodepoints");
extern fn void set_text_line_spacing(int spacing) @cname("SetTextLineSpacing");
extern fn int measure_text(ZString text, int font_size) @cname("MeasureText");
extern fn Vector2 measure_text_ex(Font font, ZString text, float font_size, float spacing) @cname("MeasureTextEx");
extern fn Vector2 measure_text_codepoints(Font font, int* codepoints, int length, float font_size, float spacing) @cname("MeasureTextCodepoints");
extern fn int get_glyph_index(Font font, int codepoint) @cname("GetGlyphIndex");
extern fn GlyphInfo get_glyph_info(Font font, int codepoint) @cname("GetGlyphInfo");
extern fn Rectangle get_glyph_atlas_rec(Font font, int codepoint) @cname("GetGlyphAtlasRec");
extern fn char* load_utf8(int* codepoints, int length) @cname("LoadUTF8");
extern fn void unload_utf8(char* text) @cname("UnloadUTF8");
extern fn int* load_codepoints(ZString text, int* count) @cname("LoadCodepoints");
extern fn void unload_codepoints(int* codepoints) @cname("UnloadCodepoints");
extern fn int get_codepoint_count(ZString text) @cname("GetCodepointCount");
extern fn int get_codepoint(ZString text, int* codepoint_size) @cname("GetCodepoint");
extern fn int get_codepoint_next(ZString text, int* codepoint_size) @cname("GetCodepointNext");
extern fn int get_codepoint_previous(ZString text, int* codepoint_size) @cname("GetCodepointPrevious");
extern fn ZString codepoint_to_utf8(int codepoint, int* utf8_size) @cname("CodepointToUTF8");
extern fn char** load_text_lines(ZString text, int* count) @cname("LoadTextLines");
extern fn void unload_text_lines(char** text, int line_count) @cname("UnloadTextLines");
extern fn int text_copy(char* dst, ZString src) @cname("TextCopy");
extern fn bool text_is_equal(ZString text1, ZString text2) @cname("TextIsEqual");
extern fn uint text_length(ZString text) @cname("TextLength");
extern fn ZString text_format(ZString text, ...) @cname("TextFormat");
extern fn ZString text_subtext(ZString text, int position, int length) @cname("TextSubtext");
extern fn ZString text_remove_spaces(ZString text) @cname("TextRemoveSpaces");
extern fn char* get_text_between(ZString text, ZString begin, ZString end) @cname("GetTextBetween");
extern fn char* text_replace(ZString text, ZString search, ZString replacement) @cname("TextReplace");
extern fn char* text_replace_alloc(ZString text, ZString search, ZString replacement) @cname("TextReplaceAlloc");
extern fn char* text_replace_between(ZString text, ZString begin, ZString end, ZString replacement) @cname("TextReplaceBetween");
extern fn char* text_replace_between_alloc(ZString text, ZString begin, ZString end, ZString replacement) @cname("TextReplaceBetweenAlloc");
extern fn char* text_insert(ZString text, ZString insert, int position) @cname("TextInsert");
extern fn char* text_insert_alloc(ZString text, ZString insert, int position) @cname("TextInsertAlloc");
extern fn char* text_join(char** text_list, int count, ZString delimiter) @cname("TextJoin");
extern fn char** text_split(ZString text, char delimiter, int* count) @cname("TextSplit");
extern fn void text_append(char* text, ZString append, int* position) @cname("TextAppend");
extern fn int text_find_index(ZString text, ZString search) @cname("TextFindIndex");
extern fn char* text_to_upper(ZString text) @cname("TextToUpper");
extern fn char* text_to_lower(ZString text) @cname("TextToLower");
extern fn char* text_to_pascal(ZString text) @cname("TextToPascal");
extern fn char* text_to_snake(ZString text) @cname("TextToSnake");
extern fn char* text_to_camel(ZString text) @cname("TextToCamel");
extern fn int text_to_integer(ZString text) @cname("TextToInteger");
extern fn float text_to_float(ZString text) @cname("TextToFloat");
extern fn void draw_line3d(Vector3 start_pos, Vector3 end_pos, Color color) @cname("DrawLine3D");
extern fn void draw_point3d(Vector3 position, Color color) @cname("DrawPoint3D");
extern fn void draw_circle3d(Vector3 center, float radius, Vector3 rotation_axis, float rotation_angle, Color color) @cname("DrawCircle3D");
extern fn void draw_triangle3d(Vector3 v1, Vector3 v2, Vector3 v3, Color color) @cname("DrawTriangle3D");
extern fn void draw_triangle_strip3d(Vector3* points, int point_count, Color color) @cname("DrawTriangleStrip3D");
extern fn void draw_cube(Vector3 position, float width, float height, float length, Color color) @cname("DrawCube");
extern fn void draw_cube_v(Vector3 position, Vector3 size, Color color) @cname("DrawCubeV");
extern fn void draw_cube_wires(Vector3 position, float width, float height, float length, Color color) @cname("DrawCubeWires");
extern fn void draw_cube_wires_v(Vector3 position, Vector3 size, Color color) @cname("DrawCubeWiresV");
extern fn void draw_sphere(Vector3 center_pos, float radius, Color color) @cname("DrawSphere");
extern fn void draw_sphere_ex(Vector3 center_pos, float radius, int rings, int slices, Color color) @cname("DrawSphereEx");
extern fn void draw_sphere_wires(Vector3 center_pos, float radius, int rings, int slices, Color color) @cname("DrawSphereWires");
extern fn void draw_cylinder(Vector3 position, float radius_top, float radius_bottom, float height, int slices, Color color) @cname("DrawCylinder");
extern fn void draw_cylinder_ex(Vector3 start_pos, Vector3 end_pos, float start_radius, float end_radius, int sides, Color color) @cname("DrawCylinderEx");
extern fn void draw_cylinder_wires(Vector3 position, float radius_top, float radius_bottom, float height, int slices, Color color) @cname("DrawCylinderWires");
extern fn void draw_cylinder_wires_ex(Vector3 start_pos, Vector3 end_pos, float start_radius, float end_radius, int sides, Color color) @cname("DrawCylinderWiresEx");
extern fn void draw_capsule(Vector3 start_pos, Vector3 end_pos, float radius, int slices, int rings, Color color) @cname("DrawCapsule");
extern fn void draw_capsule_wires(Vector3 start_pos, Vector3 end_pos, float radius, int slices, int rings, Color color) @cname("DrawCapsuleWires");
extern fn void draw_plane(Vector3 center_pos, Vector2 size, Color color) @cname("DrawPlane");
extern fn void draw_ray(Ray ray, Color color) @cname("DrawRay");
extern fn void draw_grid(int slices, float spacing) @cname("DrawGrid");
extern fn Model load_model(ZString file_name) @cname("LoadModel");
extern fn Model load_model_from_mesh(Mesh mesh) @cname("LoadModelFromMesh");
extern fn bool is_model_valid(Model model) @cname("IsModelValid");
extern fn void unload_model(Model model) @cname("UnloadModel");
extern fn BoundingBox get_model_bounding_box(Model model) @cname("GetModelBoundingBox");
extern fn void draw_model(Model model, Vector3 position, float scale, Color tint) @cname("DrawModel");
extern fn void draw_model_ex(Model model, Vector3 position, Vector3 rotation_axis, float rotation_angle, Vector3 scale, Color tint) @cname("DrawModelEx");
extern fn void draw_model_wires(Model model, Vector3 position, float scale, Color tint) @cname("DrawModelWires");
extern fn void draw_model_wires_ex(Model model, Vector3 position, Vector3 rotation_axis, float rotation_angle, Vector3 scale, Color tint) @cname("DrawModelWiresEx");
extern fn void draw_bounding_box(BoundingBox box, Color color) @cname("DrawBoundingBox");
extern fn void draw_billboard(Camera camera, Texture2D texture, Vector3 position, float scale, Color tint) @cname("DrawBillboard");
extern fn void draw_billboard_rec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint) @cname("DrawBillboardRec");
extern fn void draw_billboard_pro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint) @cname("DrawBillboardPro");
extern fn void upload_mesh(Mesh* mesh, bool dynamic) @cname("UploadMesh");
extern fn void update_mesh_buffer(Mesh mesh, int index, void* data, int data_size, int offset) @cname("UpdateMeshBuffer");
extern fn void unload_mesh(Mesh mesh) @cname("UnloadMesh");
extern fn void draw_mesh(Mesh mesh, Material material, Matrix transform) @cname("DrawMesh");
extern fn void draw_mesh_instanced(Mesh mesh, Material material, Matrix* transforms, int instances) @cname("DrawMeshInstanced");
extern fn BoundingBox get_mesh_bounding_box(Mesh mesh) @cname("GetMeshBoundingBox");
extern fn void gen_mesh_tangents(Mesh* mesh) @cname("GenMeshTangents");
extern fn bool export_mesh(Mesh mesh, ZString file_name) @cname("ExportMesh");
extern fn bool export_mesh_as_code(Mesh mesh, ZString file_name) @cname("ExportMeshAsCode");
extern fn Mesh gen_mesh_poly(int sides, float radius) @cname("GenMeshPoly");
extern fn Mesh gen_mesh_plane(float width, float length, int res_x, int res_z) @cname("GenMeshPlane");
extern fn Mesh gen_mesh_cube(float width, float height, float length) @cname("GenMeshCube");
extern fn Mesh gen_mesh_sphere(float radius, int rings, int slices) @cname("GenMeshSphere");
extern fn Mesh gen_mesh_hemi_sphere(float radius, int rings, int slices) @cname("GenMeshHemiSphere");
extern fn Mesh gen_mesh_cylinder(float radius, float height, int slices) @cname("GenMeshCylinder");
extern fn Mesh gen_mesh_cone(float radius, float height, int slices) @cname("GenMeshCone");
extern fn Mesh gen_mesh_torus(float radius, float size, int rad_seg, int sides) @cname("GenMeshTorus");
extern fn Mesh gen_mesh_knot(float radius, float size, int rad_seg, int sides) @cname("GenMeshKnot");
extern fn Mesh gen_mesh_heightmap(Image heightmap, Vector3 size) @cname("GenMeshHeightmap");
extern fn Mesh gen_mesh_cubicmap(Image cubicmap, Vector3 cube_size) @cname("GenMeshCubicmap");
extern fn Material* load_materials(ZString file_name, int* material_count) @cname("LoadMaterials");
extern fn Material load_material_default() @cname("LoadMaterialDefault");
extern fn bool is_material_valid(Material material) @cname("IsMaterialValid");
extern fn void unload_material(Material material) @cname("UnloadMaterial");
extern fn void set_material_texture(Material* material, int map_type, Texture2D texture) @cname("SetMaterialTexture");
extern fn void set_model_mesh_material(Model* model, int mesh_id, int material_id) @cname("SetModelMeshMaterial");
extern fn ModelAnimation* load_model_animations(ZString file_name, int* anim_count) @cname("LoadModelAnimations");
extern fn void update_model_animation(Model model, ModelAnimation anim, float frame) @cname("UpdateModelAnimation");
extern fn void update_model_animation_ex(Model model, ModelAnimation anim_a, float frame_a, ModelAnimation anim_b, float frame_b, float blend) @cname("UpdateModelAnimationEx");
extern fn void unload_model_animations(ModelAnimation* animations, int anim_count) @cname("UnloadModelAnimations");
extern fn bool is_model_animation_valid(Model model, ModelAnimation anim) @cname("IsModelAnimationValid");
extern fn bool check_collision_spheres(Vector3 center1, float radius1, Vector3 center2, float radius2) @cname("CheckCollisionSpheres");
extern fn bool check_collision_boxes(BoundingBox box1, BoundingBox box2) @cname("CheckCollisionBoxes");
extern fn bool check_collision_box_sphere(BoundingBox box, Vector3 center, float radius) @cname("CheckCollisionBoxSphere");
extern fn RayCollision get_ray_collision_sphere(Ray ray, Vector3 center, float radius) @cname("GetRayCollisionSphere");
extern fn RayCollision get_ray_collision_box(Ray ray, BoundingBox box) @cname("GetRayCollisionBox");
extern fn RayCollision get_ray_collision_mesh(Ray ray, Mesh mesh, Matrix transform) @cname("GetRayCollisionMesh");
extern fn RayCollision get_ray_collision_triangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3) @cname("GetRayCollisionTriangle");
extern fn RayCollision get_ray_collision_quad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) @cname("GetRayCollisionQuad");
extern fn void init_audio_device() @cname("InitAudioDevice");
extern fn void close_audio_device() @cname("CloseAudioDevice");
extern fn bool is_audio_device_ready() @cname("IsAudioDeviceReady");
extern fn void set_master_volume(float volume) @cname("SetMasterVolume");
extern fn float get_master_volume() @cname("GetMasterVolume");
extern fn Wave load_wave(ZString file_name) @cname("LoadWave");
extern fn Wave load_wave_from_memory(ZString file_type, ZString file_data, int data_size) @cname("LoadWaveFromMemory");
extern fn bool is_wave_valid(Wave wave) @cname("IsWaveValid");
extern fn Sound load_sound(ZString file_name) @cname("LoadSound");
extern fn Sound load_sound_from_wave(Wave wave) @cname("LoadSoundFromWave");
extern fn Sound load_sound_alias(Sound source) @cname("LoadSoundAlias");
extern fn bool is_sound_valid(Sound sound) @cname("IsSoundValid");
extern fn void update_sound(Sound sound, void* data, int sample_count) @cname("UpdateSound");
extern fn void unload_wave(Wave wave) @cname("UnloadWave");
extern fn void unload_sound(Sound sound) @cname("UnloadSound");
extern fn void unload_sound_alias(Sound alias_) @cname("UnloadSoundAlias");
extern fn bool export_wave(Wave wave, ZString file_name) @cname("ExportWave");
extern fn bool export_wave_as_code(Wave wave, ZString file_name) @cname("ExportWaveAsCode");
extern fn void play_sound(Sound sound) @cname("PlaySound");
extern fn void stop_sound(Sound sound) @cname("StopSound");
extern fn void pause_sound(Sound sound) @cname("PauseSound");
extern fn void resume_sound(Sound sound) @cname("ResumeSound");
extern fn bool is_sound_playing(Sound sound) @cname("IsSoundPlaying");
extern fn void set_sound_volume(Sound sound, float volume) @cname("SetSoundVolume");
extern fn void set_sound_pitch(Sound sound, float pitch) @cname("SetSoundPitch");
extern fn void set_sound_pan(Sound sound, float pan) @cname("SetSoundPan");
extern fn Wave wave_copy(Wave wave) @cname("WaveCopy");
extern fn void wave_crop(Wave* wave, int init_frame, int final_frame) @cname("WaveCrop");
extern fn void wave_format(Wave* wave, int sample_rate, int sample_size, int channels) @cname("WaveFormat");
extern fn float* load_wave_samples(Wave wave) @cname("LoadWaveSamples");
extern fn void unload_wave_samples(float* samples) @cname("UnloadWaveSamples");
extern fn Music load_music_stream(ZString file_name) @cname("LoadMusicStream");
extern fn Music load_music_stream_from_memory(ZString file_type, ZString data, int data_size) @cname("LoadMusicStreamFromMemory");
extern fn bool is_music_valid(Music music) @cname("IsMusicValid");
extern fn void unload_music_stream(Music music) @cname("UnloadMusicStream");
extern fn void play_music_stream(Music music) @cname("PlayMusicStream");
extern fn bool is_music_stream_playing(Music music) @cname("IsMusicStreamPlaying");
extern fn void update_music_stream(Music music) @cname("UpdateMusicStream");
extern fn void stop_music_stream(Music music) @cname("StopMusicStream");
extern fn void pause_music_stream(Music music) @cname("PauseMusicStream");
extern fn void resume_music_stream(Music music) @cname("ResumeMusicStream");
extern fn void seek_music_stream(Music music, float position) @cname("SeekMusicStream");
extern fn void set_music_volume(Music music, float volume) @cname("SetMusicVolume");
extern fn void set_music_pitch(Music music, float pitch) @cname("SetMusicPitch");
extern fn void set_music_pan(Music music, float pan) @cname("SetMusicPan");
extern fn float get_music_time_length(Music music) @cname("GetMusicTimeLength");
extern fn float get_music_time_played(Music music) @cname("GetMusicTimePlayed");
extern fn AudioStream load_audio_stream(uint sample_rate, uint sample_size, uint channels) @cname("LoadAudioStream");
extern fn bool is_audio_stream_valid(AudioStream stream) @cname("IsAudioStreamValid");
extern fn void unload_audio_stream(AudioStream stream) @cname("UnloadAudioStream");
extern fn void update_audio_stream(AudioStream stream, void* data, int frame_count) @cname("UpdateAudioStream");
extern fn bool is_audio_stream_processed(AudioStream stream) @cname("IsAudioStreamProcessed");
extern fn void play_audio_stream(AudioStream stream) @cname("PlayAudioStream");
extern fn void pause_audio_stream(AudioStream stream) @cname("PauseAudioStream");
extern fn void resume_audio_stream(AudioStream stream) @cname("ResumeAudioStream");
extern fn bool is_audio_stream_playing(AudioStream stream) @cname("IsAudioStreamPlaying");
extern fn void stop_audio_stream(AudioStream stream) @cname("StopAudioStream");
extern fn void set_audio_stream_volume(AudioStream stream, float volume) @cname("SetAudioStreamVolume");
extern fn void set_audio_stream_pitch(AudioStream stream, float pitch) @cname("SetAudioStreamPitch");
extern fn void set_audio_stream_pan(AudioStream stream, float pan) @cname("SetAudioStreamPan");
extern fn void set_audio_stream_buffer_size_default(int size) @cname("SetAudioStreamBufferSizeDefault");
extern fn void set_audio_stream_callback(AudioStream stream, AudioCallback callback) @cname("SetAudioStreamCallback");
extern fn void attach_audio_stream_processor(AudioStream stream, AudioCallback processor) @cname("AttachAudioStreamProcessor");
extern fn void detach_audio_stream_processor(AudioStream stream, AudioCallback processor) @cname("DetachAudioStreamProcessor");
extern fn void attach_audio_mixed_processor(AudioCallback processor) @cname("AttachAudioMixedProcessor");
extern fn void detach_audio_mixed_processor(AudioCallback processor) @cname("DetachAudioMixedProcessor");
