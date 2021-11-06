#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

NthPrime(n){
    i:=3
    j:=1
    Loop{
        j:=j+2
        j2:=j*j
        ibj:= Mod(i,j)
        If (j2>i){
            n:=n-1
            if(n=1)
                Break
            i:=i+2
            j:=1
        }Else if (ibj=0){
            i:=i+2
            j:=1
        }
    }
    Return i
}

st:=A_TickCount
ret:=NthPrime(10000)
et:=A_TickCount
during:=et-st

msgbox, result: %ret% cost: %during% ms