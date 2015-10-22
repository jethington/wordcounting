import std.stdio;
import std.string;
import std.algorithm;
import std.typecons;

// argument: name of input file
// recommend piping output to a file as well
void main(string[] args) {
  int[string] words;
  
  auto f = File(args[1], "r");
  while (!f.eof()) {
    string line = chomp(f.readln()).removechars(",.!_;:").toLower();
    string[] linewords = line.split();
    foreach (s; linewords) {
      if (s in words) {
        words[s]++;
      }
      else {
        words[s] = 1;
      }
    }
  }
  
  Tuple!(string, int)[] results;
  foreach(key, value; words)  {
    results ~= tuple(key, value);
  }
  sort!("a[1] > b[1]")(results);
  
  foreach(r; results) {
    writeln(r[1], ": ", r[0]);
  }
}
