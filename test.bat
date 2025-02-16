@echo off

call :convert burbank
call :convert closeup
call :convert cloud
call :convert green
call :convert ikea
call :convert newyork
call :convert oregon
call :convert overcast1
call :convert overcast2
call :convert panel
call :convert portland
call :convert sanfran
call :convert spitfire
call :convert sunrise
call :convert usbank

exit /b %ERRORLEVEL%


:convert

cargo run --release -- ^
    --exposure=-4 ^
    --pre-gamma=2 ^
    --tone-map=reinhard ^
    --saturation=1.5 ^
    --post-gamma=0.5 ^
    --color-map=clip ^
    samples\%1-hdr.jxr ^
    samples\%1-sdr.jpg

exit /b 0
