// Decompiled by library.dedaub.com
// 2022.12.31 21:04 UTC

// Data structures and variables inferred from the use of storage instructions
uint256[] ___function_selector__; // STORAGE[0x0]


// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__() public payable { 
    MEM[64] = 128;
    require(!msg.value);
    MEM[(MEM[64]) len (this.code.size - 3241)] = this.code[3241 len (this.code.size - 3241)];
    MEM[64] += this.code.size - 3241;
    require(MEM[64] + (this.code.size - 3241) - MEM[64] >= 32);
    require(MEM[MEM[64] + 0] <= 0xffffffffffffffff);
    require(MEM[64] + MEM[MEM[64] + 0] + 31 < MEM[64] + (this.code.size - 3241));
    require(MEM[MEM[64] + MEM[MEM[64] + 0]] <= 0xffffffffffffffff, Panic(65));
    v0 = new bytes[](MEM[MEM[64] + MEM[MEM[64] + 0]]);
    require(!((v0 + ((MEM[MEM[64] + MEM[MEM[64] + 0]] + 31 & ~0x1f) + 32 + 31 & ~0x1f) > 0xffffffffffffffff) | (v0 + ((MEM[MEM[64] + MEM[MEM[64] + 0]] + 31 & ~0x1f) + 32 + 31 & ~0x1f) < v0)), Panic(65));
    require(MEM[64] + MEM[MEM[64] + 0] + 32 + MEM[MEM[64] + MEM[MEM[64] + 0]] <= MEM[64] + (this.code.size - 3241));
    v1 = v2 = 0;
    while (v1 < MEM[MEM[64] + MEM[MEM[64] + 0]]) {
        v0[v1] = MEM[MEM[64] + MEM[MEM[64] + 0] + 32 + v1];
        v1 = v1 + 32;
    }
    v0[MEM[MEM[64] + MEM[MEM[64] + 0]]] = 0;
    require(v0.length <= 0xffffffffffffffff, Panic(65));
    v3 = ___function_selector__.length >> 1;
    if (!(___function_selector__.length & 0x1)) {
        v3 = v4 = v3 & 0xd64;
    }
    require((___function_selector__.length & 0x1) - (v3 < 32), Panic(34));
    if (v3 > 31) {
        v5 = v6 = v7 + (v0.length + 31 >> 5);
        while (v5 < v7 + (v3 + 31 >> 5)) {
            STORAGE[v5] = STORAGE[v5] & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff | 0x0;
            v5 = v5 + 1;
        }
    }
    v8 = v9 = 32;
    if (v0.length > 31 == 1) {
        v10 = v11 = 0;
        while (v10 < v0.length & ~0x1f) {
            STORAGE[v12] = MEM[v0 + v8];
            v12 = v12 + 1;
            v8 = v8 + 32;
            v10 = v10 + 32;
        }
        if (v0.length & ~0x1f < v0.length) {
            STORAGE[v12] = MEM[v0 + v8] & ~(~0 >> ((v0.length & 0x1f) << 3));
        }
        ___function_selector__.length = (v0.length << 1) + 1;
    } else {
        v13 = v14 = 0;
        if (v0.length) {
            v13 = MEM[v0.data];
        }
        ___function_selector__.length = v13 & ~(~0 >> (v0.length << 3)) | v0.length << 1;
        goto 0x55eB0x37;
    }
    return MEM[0 len 1843];
}
