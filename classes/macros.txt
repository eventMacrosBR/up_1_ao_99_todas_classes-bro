
#Virar Sacer
#sacer nescessario job 50
#CREDITOS http://openkorebrasil.org/index.php?/topic/3136-virar-novi%C3%A7o-e-sacer/
#ta em macro plugin é so reescrever algumas partes pra eventMacros
#Alterei pro IRO RESTART
#Possivel conflito com o BRO autoTalkCont 1 ainda funciona no IRO
automacro Virar Sacer 1 {
class Acolyte
job == 50
priority 2
run-once 1
call {
do conf route_maxWarpFee none
do conf route_maxNpcTries none
do conf route_teleport none
do conf lockMap none
do conf route_randomWalk 0
do conf follow 0
do move prt_church 16 39
do talknpc 16 41 c r0 c r0 c r0 c  #Bispo da Guilda
pause 60
lock Virar Sacer 1
}
}
automacro Virar Sacer 2 {
class Acolyte
location job_prist
exclusive 1
timeout 60
call {
lock Virar Sacer 1
pause 60
do talknpc 24 187 c r0 c r0 c #Smith
do conf attackAuto 2
do conf attackUseWeapon 1
do talk cont
do move job_prist 24 109
pause 3
do move job_prist 168 49
do talk resp 2
pause 5
do move job_prist 169 80
pause 5
do talk resp 2
do move job_prist 168 119
pause 5
do talk resp 2
pause 5
do move job_prist 168 157
pause 5
do talk resp 2
pause 2
do move job_prist 168 178
pause 3
do move job_prist 97 105
pause 1
do talknpc 27 24 c r0 c r1 c r0 c r0 c r1 c r1 c r0 c r0 c
pause 1
do talknpc 16 41 c
}
}
automacro vireiSacer {
class Priest
exclusive 1
map prt_church
job == 1
run-once 1
call {
do conf follow 1
do eq @inventory(Bible [2])
}
}
