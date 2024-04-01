# isitnot




the file has an reads eW93dGZob3d0aGl string as the rsi value of strcmp
![image](https://github.com/dystp1a/rev-bin/assets/143863591/a37e4a39-bcf7-4957-a933-048a38998e5d)

in strcmp the input is rotated left 3 times and right 2 times which is rol by 1

this is the rsi value of strncmp and it reads bytes from 0x400328 into the rdi value.
![image](https://github.com/dystp1a/rev-bin/assets/143863591/6af3b911-2b4b-4e29-85c3-160b4c964439) 

in strncmp, it check if the random bytes ^12 +6 == the manipulated input



# Solution script
 on rotating the (random bytes ^12 +6) right by 1 we get the flag

```py
byte_seq = [
    0xb0, 0xa4, 0x68, 0xc2, 0xce, 0x84,
    0xa2, 0xd2, 0x9a, 0x84, 0xde, 0x6a,
    0x98, 0x52, 0x6e
]

new_byt = [(byte ^ 12) + 6 for byte in byte_sequence]

for byte in new_byt:
    print((byte), end=' ')

```
> 194 174 106 212 200 142 180 228 156 142 216 108 154 100 104 

```py
a=[194, 174, 106, 212, 200, 142, 180, 228, 156, 142, 216, 108, 154, 100, 104 ]
def ror(num, shift):
        num_bits = num.bit_length()
        return ((num >> shift) | (num << (num_bits - shift))) & ((1 << num_bits) - 1)
for i in a:
    print (chr(ror(i,1)),end="")
```
> aW5jdGZrNGl6M24
flag: inctf{aW5jdGZrNGl6M24}
