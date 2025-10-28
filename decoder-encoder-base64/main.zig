const std = @import("std");

const Base64 = struct {
    _table: *const [64]u8,

    pub fn init() Base64 {
        const upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        const lower = "abcdefghijklmnopqrstuvwxyz";
        const numbers_symb = "0123456789+/";
        return Base64 {
            ._table = upper ++ lower ++ numbers_symb
        };
    }

    pub fn _char_at(self: Base64, idx: usize) u8 {
        return self._table[idx];
    }
};

pub fn main() !void {
    const base64 = Base64.init();
    std.debug.print("Character at 28: {c}", .{base64._char_at(28)});
}
