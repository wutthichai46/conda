:: Copyright (C) 2012 Anaconda, Inc
:: SPDX-License-Identifier: BSD-3-Clause

@IF NOT DEFINED CONDA_EXE (
  @FOR %%P IN ("%~dp0\..") DO @SET "__condaroot=%%~fP"

  @SET "CONDA_EXE=%__condaroot%\Scripts\conda.exe"
  @SET _CE_M=
  @SET _CE_CONDA=

  @SET __condaroot=
)
@IF [%1]==[activate]   "%~dp0_conda_activate" %*
@IF [%1]==[deactivate] "%~dp0_conda_activate" %*

@CALL "%CONDA_EXE%" %_CE_M% %_CE_CONDA% %*

@IF %errorlevel% NEQ 0 EXIT /B %errorlevel%

@IF [%1]==[install]   "%~dp0_conda_activate" reactivate
@IF [%1]==[update]    "%~dp0_conda_activate" reactivate
@IF [%1]==[upgrade]   "%~dp0_conda_activate" reactivate
@IF [%1]==[remove]    "%~dp0_conda_activate" reactivate
@IF [%1]==[uninstall] "%~dp0_conda_activate" reactivate

@EXIT /B %errorlevel%
