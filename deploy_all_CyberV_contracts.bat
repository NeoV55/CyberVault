@echo off
cd contracts

echo Building IOTA Move contracts...
iota move build

IF %ERRORLEVEL% NEQ 0 (
    echo Build failed. Exiting...
    exit /b %ERRORLEVEL%
)

echo Publishing contracts to IOTA network...
iota client publish

IF %ERRORLEVEL% NEQ 0 (
    echo Publish failed. Exiting...
    exit /b %ERRORLEVEL%
)

echo Deployment completed successfully!
pause
