// From https://ethervm.io/decompile

contract Contract {
    function main() {
        memory[0x40:0x60] = 0x80;
        var var0 = msg.value;
    
        if (var0) { revert(memory[0x00:0x00]); }
    
        if (msg.data.length < 0x04) { revert(memory[0x00:0x00]); }
    
        var0 = msg.data[0x00:0x20] >> 0xe0;
    
        if (var0 == 0x368b8772) {
            // Dispatch table entry for setMessage(string)
            var var1 = 0x0060;
            var var2 = 0x005b;
            var var4 = 0x04;
            var var3 = var4 + (msg.data.length - var4);
            var2 = func_032B(var3, var4);
            func_005B(var2);
            stop();
        } else if (var0 == 0xce6d41de) {
            // Dispatch table entry for getMessage()
            var1 = 0x006a;
            var1 = func_00B1();
            var temp0 = var1;
            var1 = 0x0077;
            var2 = temp0;
            var3 = memory[0x40:0x60];
            var1 = func_03F3(var2, var3);
            var temp1 = memory[0x40:0x60];
            return memory[temp1:temp1 + var1 - temp1];
        } else if (var0 == 0xe21f37ce) {
            // Dispatch table entry for message()
            var1 = 0x0088;
            var2 = func_0143();
            var temp2 = var2;
            var2 = 0x0095;
            var3 = temp2;
            var4 = memory[0x40:0x60];
            var2 = func_03F3(var3, var4);
            var temp3 = memory[0x40:0x60];
            return memory[temp3:temp3 + var2 - temp3];
        } else { revert(memory[0x00:0x00]); }
    }
    
    function func_005B(var arg0) {
        var var0 = 0x00;
        var var1 = 0x00ad;
        var var2 = arg0;
        var var3 = var0;
        func_062B(var2, var3);
    
    label_00AD:
    }
    
    function func_00B1() returns (var r0) {
        var var0 = 0x60;
        var var1 = 0x00;
        var var2 = 0x00c0;
        var var3 = storage[var1];
        var2 = func_0444(var3);
        var temp0 = var2;
        var temp1 = memory[0x40:0x60];
        memory[0x40:0x60] = temp1 + (temp0 + 0x1f) / 0x20 * 0x20 + 0x20;
        var temp2 = var1;
        var1 = temp1;
        var2 = temp2;
        var3 = temp0;
        memory[var1:var1 + 0x20] = var3;
        var var4 = var1 + 0x20;
        var var5 = var2;
        var var6 = 0x00ec;
        var var7 = storage[var5];
        var6 = func_0444(var7);
    
        if (!var6) {
        label_0139:
            return var1;
        } else if (0x1f < var6) {
            var temp3 = var4;
            var temp4 = temp3 + var6;
            var4 = temp4;
            memory[0x00:0x20] = var5;
            var temp5 = keccak256(memory[0x00:0x20]);
            memory[temp3:temp3 + 0x20] = storage[temp5];
            var5 = temp5 + 0x01;
            var6 = temp3 + 0x20;
        
            if (var4 <= var6) { goto label_0130; }
        
        label_011C:
            var temp6 = var5;
            var temp7 = var6;
            memory[temp7:temp7 + 0x20] = storage[temp6];
            var5 = temp6 + 0x01;
            var6 = temp7 + 0x20;
        
            if (var4 > var6) { goto label_011C; }
        
        label_0130:
            var temp8 = var4;
            var temp9 = temp8 + (var6 - temp8 & 0x1f);
            var6 = temp8;
            var4 = temp9;
            goto label_0139;
        } else {
            var temp10 = var4;
            memory[temp10:temp10 + 0x20] = storage[var5] / 0x0100 * 0x0100;
            var6 = var6;
            var4 = temp10 + 0x20;
            goto label_0139;
        }
    }
    
    function func_0143() returns (var r0) {
        r0 = 0x00;
        var var1 = 0x0150;
        var var2 = storage[r0];
        var1 = func_0444(var2);
        var temp0 = var1;
        var temp1 = memory[0x40:0x60];
        memory[0x40:0x60] = temp1 + (temp0 + 0x1f) / 0x20 * 0x20 + 0x20;
        var temp2 = r0;
        r0 = temp1;
        var1 = temp2;
        var2 = temp0;
        memory[r0:r0 + 0x20] = var2;
        var var3 = r0 + 0x20;
        var var4 = var1;
        var var6 = storage[var4];
        var var5 = 0x017c;
        var5 = func_0444(var6);
    
        if (!var5) {
        label_01C9:
            return r0;
        } else if (0x1f < var5) {
            var temp3 = var3;
            var temp4 = temp3 + var5;
            var3 = temp4;
            memory[0x00:0x20] = var4;
            var temp5 = keccak256(memory[0x00:0x20]);
            memory[temp3:temp3 + 0x20] = storage[temp5];
            var4 = temp5 + 0x01;
            var5 = temp3 + 0x20;
        
            if (var3 <= var5) { goto label_01C0; }
        
        label_01AC:
            var temp6 = var4;
            var temp7 = var5;
            memory[temp7:temp7 + 0x20] = storage[temp6];
            var4 = temp6 + 0x01;
            var5 = temp7 + 0x20;
        
            if (var3 > var5) { goto label_01AC; }
        
        label_01C0:
            var temp8 = var3;
            var temp9 = temp8 + (var5 - temp8 & 0x1f);
            var5 = temp8;
            var3 = temp9;
            goto label_01C9;
        } else {
            var temp10 = var3;
            memory[temp10:temp10 + 0x20] = storage[var4] / 0x0100 * 0x0100;
            var5 = var5;
            var3 = temp10 + 0x20;
            goto label_01C9;
        }
    }
    
    function func_01D1() returns (var r0) { return memory[0x40:0x60]; }
    
    function func_01EF(var arg0) returns (var r0) { return arg0 + 0x1f & ~0x1f; }
    
    function func_022F(var arg0, var arg1) {
        var var0 = 0x0238;
        var var1 = arg0;
        var0 = func_01EF(var1);
        var temp0 = arg1;
        var temp1 = temp0 + var0;
        var0 = temp1;
    
        if (!((var0 > 0xffffffffffffffff) | (var0 < temp0))) {
            memory[0x40:0x60] = var0;
            return;
        } else {
            var1 = 0x0256;
            memory[0x00:0x20] = 0x4e487b7100000000000000000000000000000000000000000000000000000000;
            memory[0x04:0x24] = 0x41;
            revert(memory[0x00:0x24]);
        }
    }
    
    function func_027B(var arg0) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 <= 0xffffffffffffffff) {
            var var1 = 0x029f;
            var var2 = arg0;
            var1 = func_01EF(var2);
            return var1 + 0x20;
        } else {
            var1 = 0x0295;
            memory[0x00:0x20] = 0x4e487b7100000000000000000000000000000000000000000000000000000000;
            memory[0x04:0x24] = 0x41;
            revert(memory[0x00:0x24]);
        }
    }
    
    function func_02AC(var arg0, var arg1, var arg2) {
        var temp0 = arg0;
        var temp1 = arg1;
        memory[temp1:temp1 + temp0] = msg.data[arg2:arg2 + temp0];
        memory[temp1 + temp0:temp1 + temp0 + 0x20] = 0x00;
    }
    
    function func_02BB(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x02ce;
        var var2 = 0x02c9;
        var var3 = arg1;
        var2 = func_027B(var3);
        var1 = func_02C9(var2);
        var temp0 = var1;
        var0 = temp0;
        var temp1 = arg1;
        memory[var0:var0 + 0x20] = temp1;
        var1 = var0 + 0x20;
    
        if (arg2 + temp1 <= arg0) {
            var2 = 0x02f5;
            var3 = arg1;
            var var4 = var1;
            var var5 = arg2;
            func_02AC(var3, var4, var5);
            return var0;
        } else {
            var2 = 0x02e9;
            revert(memory[0x00:0x00]);
        }
    }
    
    function func_02C9(var arg0) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x026a;
        var1 = func_01D1();
        var temp0 = var1;
        var0 = temp0;
        var1 = 0x0276;
        var var2 = arg0;
        var var3 = var0;
        func_022F(var2, var3);
        return var0;
    }
    
    function func_02FD(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 + 0x1f i< arg0) {
            var temp0 = arg1;
            var var1 = msg.data[temp0:temp0 + 0x20];
            var var2 = 0x0322;
            var var3 = arg0;
            var var4 = var1;
            var var5 = temp0 + 0x20;
            return func_02BB(var3, var4, var5);
        } else {
            var1 = 0x0311;
            revert(memory[0x00:0x00]);
        }
    }
    
    function func_032B(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 - arg1 i>= 0x20) {
            var var1 = msg.data[arg1:arg1 + 0x20];
        
            if (var1 <= 0xffffffffffffffff) {
                var var2 = 0x036b;
                var var3 = arg0;
                var var4 = arg1 + var1;
                return func_02FD(var3, var4);
            } else {
                var2 = 0x035e;
                revert(memory[0x00:0x00]);
            }
        } else {
            var1 = 0x0340;
            revert(memory[0x00:0x00]);
        }
    }
    
    function func_0374(var arg0) returns (var r0) { return memory[arg0:arg0 + 0x20]; }
    
    function func_037F(var arg0, var arg1) returns (var r0) {
        var temp0 = arg1;
        memory[temp0:temp0 + 0x20] = arg0;
        return temp0 + 0x20;
    }
    
    function func_0390(var arg0, var arg1, var arg2) {
        var var0 = 0x00;
    
        if (var0 >= arg0) {
        label_03AE:
            memory[arg1 + arg0:arg1 + arg0 + 0x20] = 0x00;
            return;
        } else {
        label_039C:
            var temp0 = var0;
            memory[arg1 + temp0:arg1 + temp0 + 0x20] = memory[arg2 + temp0:arg2 + temp0 + 0x20];
            var0 = temp0 + 0x20;
        
            if (var0 >= arg0) { goto label_03AE; }
            else { goto label_039C; }
        }
    }
    
    function func_03BA(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x03c5;
        var var2 = arg1;
        var1 = func_0374(var2);
        var2 = 0x03cf;
        var var3 = var1;
        var var4 = arg0;
        var2 = func_037F(var3, var4);
        var temp0 = var2;
        arg0 = temp0;
        var2 = 0x03df;
        var3 = var1;
        var4 = arg0;
        var var5 = arg1 + 0x20;
        func_0390(var3, var4, var5);
        var2 = 0x03e8;
        var3 = var1;
        var2 = func_01EF(var3);
        return arg0 + var2;
    }
    
    function func_03F3(var arg0, var arg1) returns (var r0) {
        var temp0 = arg1;
        var var0 = temp0 + 0x20;
        memory[temp0:temp0 + 0x20] = var0 - temp0;
        var var1 = 0x040d;
        var var2 = var0;
        var var3 = arg0;
        return func_03BA(var2, var3);
    }
    
    function func_0444(var arg0) returns (var r0) {
        var temp0 = arg0;
        var var0 = temp0 / 0x02;
        var var1 = temp0 & 0x01;
    
        if (!var1) {
            var temp1 = var0 & 0x7f;
            var0 = temp1;
        
            if (var1 - (var0 < 0x20)) { goto label_046F; }
            else { goto label_0467; }
        } else if (var1 - (var0 < 0x20)) {
        label_046F:
            return var0;
        } else {
        label_0467:
            var var2 = 0x046e;
            memory[0x00:0x20] = 0x4e487b7100000000000000000000000000000000000000000000000000000000;
            memory[0x04:0x24] = 0x22;
            revert(memory[0x00:0x24]);
        }
    }
    
    function func_0475(var arg0) returns (var r0) {
        memory[0x00:0x20] = arg0;
        return keccak256(memory[0x00:0x20]);
    }
    
    function func_048A(var arg0) returns (var r0) { return (arg0 + 0x1f) / 0x20; }
    
    function func_049A(var arg0, var arg1) returns (var r0) { return arg0 << arg1; }
    
    function func_04F9(var arg0) returns (var r0) { return arg0; }
    
    function func_050D(var arg0) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x0528;
        var var2 = 0x0523;
        var var3 = 0x051e;
        var var4 = arg0;
        var3 = func_04F9(var4);
        var2 = func_051E(var3);
        return func_0523(var2);
    }
    
    function func_051E(var arg0) returns (var r0) { return arg0; }
    
    function func_0523(var arg0) returns (var r0) {
        r0 = func_04F9(arg0);
        // Error: Could not resolve method call return address!
    }
    
    function func_052F(var arg0) returns (var r0) { return arg0; }
    
    function func_0539(var arg0, var arg1, var arg2) {
        var var0 = 0x0542;
        var var1 = arg0;
        var0 = func_050D(var1);
        var1 = 0x0556;
        var var2 = 0x054e;
        var var3 = var0;
        var2 = func_052F(var3);
        var1 = func_054E(arg1, arg2, var2);
        storage[arg2] = var1;
    }
    
    function func_054E(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = arg0;
        var var1 = storage[arg1];
        var var2 = 0x00;
        var var3 = var0 * 0x08;
        var var4 = 0x04d7;
        var var5 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        var var6 = var3;
        var4 = func_049A(var5, var6);
        var5 = 0x04e1;
        var6 = arg2;
        var var7 = var3;
        var5 = func_049A(var6, var7);
        var temp0 = var4;
        return (var1 & ~temp0) | (var5 & temp0);
    }
    
    function func_055E() returns (var r0) { return 0x00; }
    
    function func_0563(var arg0, var arg1) {
        var var0 = 0x056b;
        var0 = func_055E();
        var var1 = 0x0576;
        var var2 = var0;
        var var3 = arg0;
        var var4 = arg1;
        func_0539(var2, var3, var4);
    }
    
    function func_059E(var arg0, var arg1, var arg2) {
        if (arg1 <= 0x1f) {
        label_05DF:
            return;
        } else {
            var var0 = 0x05b0;
            var var1 = arg2;
            var0 = func_0475(var1);
            var1 = 0x05b9;
            var var2 = arg0;
            var1 = func_048A(var2);
            var1 = var0 + var1;
        
            if (arg0 >= 0x20) {
                var2 = 0x05dc;
                var var3 = 0x05d4;
                var var4 = arg1;
                var3 = func_048A(var4);
                func_05D4(var0, var1, var3);
            
            label_05DC:
                goto label_05DF;
            } else {
                var1 = var0;
                var2 = 0x05dc;
                var3 = 0x05d4;
                var4 = arg1;
                var3 = func_048A(var4);
                func_05D4(var0, var1, var3);
                goto label_05DC;
            }
        }
    }
    
    function func_05D4(var arg0, var arg1, var arg2) {
        arg2 = arg0 + arg2;
        var var0 = arg1;
    
        if (var0 >= arg2) {
        label_059A:
            return;
        } else {
        label_0585:
            var var1 = 0x058f;
            var var2 = 0x00;
            var var3 = var0;
            func_0563(var2, var3);
            var0 = var0 + 0x01;
        
            if (var0 >= arg2) { goto label_059A; }
            else { goto label_0585; }
        }
    }
    
    function func_05E4(var arg0, var arg1) returns (var r0) { return arg0 >> arg1; }
    
    function func_05F1(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x0602;
        var var2 = ~0x00;
        var var3 = arg0 * 0x08;
        var1 = func_05E4(var2, var3);
        return arg1 & ~var1;
    }
    
    function func_060F(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x061b;
        var var2 = arg0;
        var var3 = arg1;
        var1 = func_05F1(var2, var3);
        return var1 | arg0 * 0x02;
    }
    
    function func_062B(var arg0, var arg1) {
        var var0 = 0x0634;
        var var1 = arg0;
        var0 = func_0374(var1);
    
        if (var0 <= 0xffffffffffffffff) {
            var1 = 0x0657;
            var var2 = storage[arg1];
            var1 = func_0444(var2);
            var2 = 0x0662;
            var var3 = var0;
            var var4 = var1;
            var var5 = arg1;
            func_059E(var3, var4, var5);
            var2 = 0x20;
            var3 = var0 > 0x1f;
        
            if (var3 == 0x01) {
                var4 = var0 & ~0x1f;
                var5 = 0x06a3;
                var var6 = arg1;
                var5 = func_0475(var6);
                var6 = 0x00;
            
                if (var6 >= var4) {
                label_06CB:
                
                    if (var4 >= var0) {
                    label_06E8:
                        storage[arg1] = var0 * 0x02 + 0x01;
                        return;
                    } else {
                        var var7 = memory[arg0 + var2:arg0 + var2 + 0x20];
                        var var8 = 0x06e4;
                        var var9 = var0 & 0x1f;
                        var var10 = var7;
                        var8 = func_05F1(var9, var10);
                        storage[var5] = var8;
                        goto label_06E8;
                    }
                } else {
                label_06AF:
                    var temp0 = var2;
                    var temp1 = var5;
                    storage[temp1] = memory[arg0 + temp0:arg0 + temp0 + 0x20];
                    var5 = temp1 + 0x01;
                    var2 = temp0 + 0x20;
                    var6 = var6 + 0x20;
                
                    if (var6 >= var4) { goto label_06CB; }
                    else { goto label_06AF; }
                }
            } else {
                var4 = 0x00;
            
                if (!var0) {
                    var5 = 0x068d;
                    var6 = var0;
                    var7 = var4;
                    var5 = func_060F(var6, var7);
                
                label_068D:
                    storage[arg1] = var5;
                    return;
                } else {
                    var4 = memory[arg0 + var2:arg0 + var2 + 0x20];
                    var5 = 0x068d;
                    var6 = var0;
                    var7 = var4;
                    var5 = func_060F(var6, var7);
                    goto label_068D;
                }
            }
        } else {
            var1 = 0x064c;
            memory[0x00:0x20] = 0x4e487b7100000000000000000000000000000000000000000000000000000000;
            memory[0x04:0x24] = 0x41;
            revert(memory[0x00:0x24]);
        }
    }
}
