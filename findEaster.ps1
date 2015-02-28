<#
    Description:
    Given the year - Write a program to figure out the exact date of Easter for that year.

    store dates of Easter - 

    "5th April 2015"
    "27th March 2016"
    "16th April 2017"
    "1st April 2018"
    "21st April 2019"
    "12th April 2020"
    "4th April 2021"
    "17th April 2022"
    "9th April 2023"
    "31st March 2024"
    "20th April 2025"

    Input:
    A year.
#>

$easterDate =  (
    "5th April 2015", 
    "27th March 2016",
    "16th April 2017",
    "1st April 2018",
    "21st April 2019",
    "12th April 2020",
    "4th April 2021",
    "17th April 2022",
    "9th April 2023",
    "31st March 2024",
    "20th April 2025")

# take cli input
$dateInput = Read-Host("Year ")
$intDate = [int]$dateInput 

$easterDate -match $intDate

$url = "http://www.wheniseastersunday.com/year/$intDate/"
$html = Invoke-WebRequest $url
$easter = $html.AllElements | Where Class -eq "easterdate" | Select -First 1 -ExpandProperty InnerText
Write-Output "$intDate - $easter"
