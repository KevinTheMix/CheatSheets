```C#
/// <summary>
/// Checks whether a given string starts with any of the strings in a given list.
/// </summary>
/// <param name="source">The string whose beginning is looked-up.</param>
/// <param name="list">The list of starting strings to look-up.</param>
/// <returns>True if the source string starts with one of the strings in the list.</returns>
public static bool StartsWith(this string source, params string[] list)
{
    if (null == source) throw new ArgumentNullException("source");
    foreach (string start in list)
        if (source.StartsWith(start))
            return true;
    return false;
}
```

```C#
/// <summary>
/// Checks whether a given string is present in a given list of strings. String extension method.
/// </summary>
/// <param name="source">The string to look-up.</param>
/// <param name="list">The list of strings in which to look-up.</param>
/// <returns>True if the source string is present in the list.</returns>
public static bool In(this string source, params string[] list)
{
    if (null == source) throw new ArgumentNullException("source");
    return list.Contains(source, StringComparer.OrdinalIgnoreCase);
}

/// <summary>
/// Checks whether a given string is present in a given list of strings. String extension method.
/// </summary>
/// <param name="source">The string to look-up.</param>
/// <param name="serializedList">A serialized string containing the list of strings in which to look-up.</param>
/// <param name="separator">The character(s) used as separator in the serialized list.</param>        
/// <returns>True if the source string is present in the list.</returns>
public static bool In(this string source, string serializedList, string separator)
{
    return source.In(serializedList.Split(new string[] { separator }, StringSplitOptions.RemoveEmptyEntries));
}
```

```C#
/// <summary>
/// Returns a string repeated a given number of times (e.g. "ko" x 2 = "koko").
/// String extension method.
/// </summary>
/// <param name="text">The string to repeat.</param>
/// <param name="nbOfRepetition">The number of repetitions.</param>
/// <returns>The repeated string.</returns>
public static string Repeat(this string text, int nbOfRepetition)
{
    StringBuilder result = new StringBuilder(nbOfRepetition * text.Length);
    for (int i = 0; i < nbOfRepetition; i++)
    {
        result.Append(text);
    }

    return result.ToString();
}
```

```C#
/// <summary>
/// Returns the number of occurences of any characters in the mask at the start of a given string.
/// (Implements the PHP method strspn() which returns the length of the longest starting string that is solely 
/// formed by the characters specified in the mask.)
/// </summary>
/// <param name="text">The text to browse.</param>
/// <param name="mask">The mask of valid characters.</param>
/// <returns>The length of the longest starting string made of characters from the mask.</returns>
public static int Count(this string text, string mask)
{
    int count = 0;
    foreach (char c in text)
    {
        if (!mask.Contains(c.ToString()))
            break;
        ++count;
    }
    return count;
}
```
