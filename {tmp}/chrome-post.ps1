$Input = Get-Process -Name 'chrome'
[Object[]] $Input

$Win32ShowWindowAsync = Add-Type -MemberDefinition @'
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
'@ -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru

foreach ($process in $Input) {
	$handle = $process.MainWindowHandle

	if ($handle -eq 0) {
		continue
	}

	$Win32ShowWindowAsync::ShowWindowAsync($handle, 0) | Out-Null
}