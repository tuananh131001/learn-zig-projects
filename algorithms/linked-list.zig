const std = @import("std");

const Node = struct { value: u32, next: ?*Node };
const LinkedList = struct {
    length: u32,
    head: ?*Node,
    pub fn insert(self: *LinkedList, value: u32) void {
        var temp = Node { .value = 0, .next = null};
        temp.value = value;
        temp.next = self.head;
        self.head = &temp;
    }
    pub fn new() LinkedList {
        return LinkedList{.length = 0, .head=null};
    }
};

pub fn main() !void {
    var list = LinkedList.new();
    list.insert(10);

    std.debug.print("{}\n", .{list.head.?.value}); // Optional Unwrap
}
