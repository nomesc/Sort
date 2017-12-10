.data
   v:.word 2, 1, 3, 2, 1  # The array
   n:.word 5              # Number of elements
   i:.space 4             
   k:.space 4
.text
main:
 sw $zero,i                 # i=0
#loop1
entry:
 lw $t0,i
 lw $t1,n
 bge $t0,$t1,exit       # if(i>=n) exit
 add $t0,$t0,$t0
 add $t0,$t0,$t0          #  $t0=4*i
 lw $s0,i
 addi $s0,$s0,1           #k=i+1
 sw $s0,k
 #loop2
entry2: 
 lw $t2,k
 lw $t7,v($t0)            # $t7:=v[i]
 bgt $t2,$t1,exit2
 add $t2,$t2,$t2
 add $t2,$t2,$t2
 lw $t3,v($t2)
 lw $t4,k
 addi $t4,$t4,1
 sw $t4,k                 #k++
 ble $t7,$t3,entry2
 move $t5,$t7
 move $t6,$t3
 sw $t6,v($t0)
 sw $t5,v($t2)
 j entry2
 
exit2:
 lw $t0,i
 addi $t0,$t0,1
 sw $t0,i                 # i=i+1
 j entry
exit:
li $v0,10
syscall