<#
.SYNOPSIS
    Determines if a value is null
.DESCRIPTION
    Determines if a value is null
.EXAMPLE Check if value is null
    Determines if the passed in value is null
    
    Assert-IsNull -Value $SomeValue
#>
function Assert-IsNull {
    [CmdletBinding(DefaultParameterSetName = 'Parameter Set 1',
        PositionalBinding = $false,
        HelpUri = 'http://www.microsoft.com/',
        ConfirmImpact = 'Medium')]
    [Alias()]
    [OutputType([String])]
    Param (
        # Param1 help description
        [Parameter(Mandatory = $false,
            Position = 0,
            ValueFromPipelineByPropertyName = $true)]
        $Value
    )

    Write-Debug -Message 'Determining if value is null'
    
    Write-Verbose -Message 'Checking value against $null'

    if ($null -eq $Value) {
        return $true
    }

    Write-Verbose -Message 'Checking value against empty string'

    if ($Value -is [String] -and $Value -eq [String]::Empty) {
        return $true
    }

    Write-Verbose -Message 'Checking value against NullString'

    if ($Value -is [DBNull] -or $Value -is [System.Management.Automation.Language.NullString]) {
        return $true
    }

    return $false
}