const std = @import("std");
const mem = std.mem;

pub fn read(comptime T: type, b: []u8, pos: usize) T {
    switch (T) {
        u16 => {
            const buffer: [2]u8 = .{ b[pos], b[pos + 1] };
            return mem.readIntLittle(u16, &buffer);
        },
        u32 => {
            const buffer: [4]u8 = .{ b[pos], b[pos + 1], b[pos + 2], b[pos + 3] };
            return mem.readIntLittle(u32, &buffer);
        },
        else => unreachable,
    }
}
