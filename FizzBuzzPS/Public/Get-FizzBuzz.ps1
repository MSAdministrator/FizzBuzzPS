<#
.SYNOPSIS
    Example of the Fizz Buzz challenge
.DESCRIPTION
    Example of the Fizz Buzz challenge based on provided input
.EXAMPLE Get FizzBuzz using default values of 3 and 5
    Getting FizzBuzz based on default values of 3 and 5
    
    Get-FizzBuzz
.EXAMPLE Get FizzBuzz using passed in values of 4 and 8
    Getting FizzBuzz based on passed in values of 4 and 8
    
    Get-FizzBuzz -FizzNumber 4 -BuzzNumber 8
#>
function Get-FizzBuzz {
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
        [int]$FizzNumber = 3,
        
        # Param2 help description
        [Parameter(Mandatory = $false,
            Position = 1,
            ValueFromPipelineByPropertyName = $true)]
        [int]$BuzzNumber = 5
)

    Write-Verbose -Message 'Starting FizzBuzz'

    for($i = 1; $i -le 100; $i++) {
        $returnObject = ''

        Write-Debug -Message "Determining if $i is a modulus of 3 or 5"

        Write-Progress -Activity "Determining Fizz Buzz" -Status "$i% Complete:" -PercentComplete $I;

        
        if ($i % $FizzNumber -eq 0) { 
            $returnObject += 'Fizz' 
        }
        if ($i % $BuzzNumber -eq 0) {
            $returnObject += 'Buzz' 
        }
        if (Assert-IsNull -Value $returnObject) {
            $returnObject = $i      
        }
    
        Write-Output $returnObject
    }
}

