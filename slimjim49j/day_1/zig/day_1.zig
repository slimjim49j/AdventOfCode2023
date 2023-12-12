const std = @import("std");

const digits = [_][*:0]const u8{ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var file = try std.fs.cwd().openFile("input", .{});
    defer file.close();

    const fileSize = try file.getEndPos();
    const input = try allocator.alloc(u8, fileSize);
    _ = try file.readAll(input);

    var sum: usize = 0;
    var seenFirst = false;
    var first: usize = 0;
    var last: usize = 0;
    for (0..fileSize) |i| {
        const ch = input[i];
        if (ch >= 48 and ch <= 57) {
            const n = ch - 48;
            if (!seenFirst) {
                first = n;
                seenFirst = true;
            }
            last = n;
        } else if (ch >= 97 and ch <= 122) {
            for (0..digits.len) |j| {
                const digit = digits[j];
                var isMatch = true;
                var k: usize = 0;
                while (digit[k] != 0) {
                    const srcCh = input[i + k];
                    const cmpCh = digit[k];
                    if (srcCh != cmpCh) {
                        isMatch = false;
                        break;
                    }
                    k += 1;
                }
                if (isMatch) {
                    if (!seenFirst) {
                        first = j;
                        seenFirst = true;
                    }
                    last = j;
                    break;
                }
            }
        } else if (ch == 10) {
            sum += (first * 10) + last;
            seenFirst = false;
            first = 0;
            last = 0;
        }
    }

    std.debug.print("{d}\n", .{sum});
}
