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

pub fn _cal_encode_length(input: []const u8) !usize {
    // return 4 if length is 3
    //
    if (input.len < 3) {
        return 4;
    }

    // divide the length by 3 then apply ceil then multiple by 4
    const n_group: usize = try std.math.divCeil(usize, input.len, 3);

    return n_group * 4;
}

pub fn main() !void {
    const base64 = Base64.init();
    const arr = "ABCDCISOS";
    std.debug.print("Character at 28: {c}", .{base64._char_at(28)});
    const len: usize = try _cal_encode_length(arr);
    std.debug.print("Size: {}", .{len});
}
