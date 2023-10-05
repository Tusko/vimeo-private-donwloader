@echo off
setlocal enabledelayedexpansion

set "count=0"
for %%F in (.\parts\*.m4v) do set /a "count+=1"
set "current=0"

echo !count!���� ������ ��ȯ�մϴ�.

for %%F in (.\parts\*.m4v) do (
    set /a "current+=1"
    echo !current!/!count! ��° ���� ��ȯ ��: %%~nxF
    ffmpeg -y -v quiet -i "parts\%%~nF.m4a" -i "parts\%%~nF.m4v" -c copy "converted\%%~nF.mp4"
    if errorlevel 1 (
        echo ���� �߻�, ��ȯ ����: %%~nxF
    ) else (
        echo !current!/!count! ��° ���� ��ȯ�� �Ϸ�Ǿ����ϴ�: %%~nxF
    )
)

echo ��� ���� ��ȯ�� �Ϸ�Ǿ����ϴ�!

endlocal