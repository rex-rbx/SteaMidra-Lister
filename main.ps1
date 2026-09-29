Get-ChildItem $env:LocalAppData\SteaMidra\saved_lua -File -Recurse -Filter *.lua |
    ForEach-Object {
        Get-Content -LiteralPath $_.FullName |
            Select-Object -Skip 1 |
            Where-Object { $_ -match '--' } |
            Select-Object -First 1 |
            ForEach-Object { ($_ -split '\s*--\s*', 2)[1].Trim() }
    }
