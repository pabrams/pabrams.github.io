## Blog Post Title From First Header

My first blog post. It has some code in it.

---

### This is a header

#### Some SQL Code

```tsql
SELECT This, [Is], A, Code, Block -- Using SSMS style syntax highlighting
    , REVERSE('abc')
FROM dbo.SomeTable s
    CROSS JOIN dbo.OtherTable o;
```

#### Some PowerShell Code

```powershell
Write-Host "This is a powershell Code block";

# There are many other languages you can use, but the style has to be loaded first

ForEach ($thing in $things) {
    Write-Output "It highlights it using the GitHub style"
}
```

#### Javascript

```JavaScript

function isVowel(x) {
    x = x.toLowerCase();
    return (
        x == "a" || 
        x == "e" || 
        x == "i" || 
        x == "o" || 
        x == "u" 
    );
}

function sumOfSentence(str){
    let sum = 0;
    for (let i=0; i<str.length; i++){
        char = str.charAt(i);
        if (isVowel(char)){
            // for vowels, add the inverse of their ascii values
            sum += (0 - (char.charCodeAt(0)))
        } else {
            sum += char.charCodeAt(0);
        }
    }
    return sum;
}
```
