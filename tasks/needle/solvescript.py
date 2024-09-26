from idc import *
from idaapi import *
from idautils import *


a=get_name_ea_simple("func_3705")
b=get_name_ea_simple("func_4647")
i=0
while i<1000:
    a+=8
    first = hex(get_dword(a))[:4]
    a+=4
    second = hex(get_dword(a))[:4]
    if first==second:
        a+=40
        next_funk = idc.get_operand_value(a, 0)
        a=next_funk
        continue
        
        
    a+=23
    patch_word(a,0x1474)
    a+=17
    next_funk = idc.get_operand_value(a, 0)
    a=next_funk
    print (hex(a),idc.get_func_name(a))
    
        
    if b==a:
        print (hex(a),idc.get_func_name(a)
)
        print("its over mfs")
        break
    i+=1
