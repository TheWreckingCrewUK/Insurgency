@ECHO OFF

echo Updating LastUpdated and PBOing...
echo Will need Mikero's PBO tools installed...

for /d %%i in (*) do (
	IF /I "%%i" == "Insurgency_Core" (
		echo Skipping Insurgency_Core...
	) else (
		IF /I "%%i" == "tools" (
			echo Skipping Tools...
		) else (
			IF /I "%%i" == ".github" (
				echo Skipping .github...
			) else (
				makePbo -P -X="none" %%i
				echo makePboing %%i
			)
		)
	)
)

PAUSE