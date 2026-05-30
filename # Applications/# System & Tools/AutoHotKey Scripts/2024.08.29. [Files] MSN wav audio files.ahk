; Replaces "Anonymous_2006_10_24@13_09_53.wav" with "2006.10.24. (13h09m53).wav"
ScrollLock::
Send {Home}
Loop, 23
{
    Send {Delete}
}
Send {Right}{Right}{Right}{Right}{Delete}.{Right}{Right}{Delete}.{Right}{Right}.{Space} ; Date
Send ({Delete}{Right}{Right}h{Delete}{Right}{Right}m{Delete}{Right}{Right}){Tab} ; Hour
return