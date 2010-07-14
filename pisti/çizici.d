// Masanın görüntülenmesi ile ilgili modül
// Şuanlık denemek amacıyla basit bir konsol uygulaması olarak yazılıyor. Daha sonra 
// isteyen gtkD ile yada QtD hadi hiç olmadı Ncurses ile yazabilir.
import std.stdio;
import std.string;
import std.conv;
dchar[] kullanıcıAdınıAl()
{
    write("Lütfen kullanıcı adınızı yazınız :");
    dchar[] kullanıcıAdı = cast(dchar[])readln();
    return kullanıcıAdı[0..$-1];
} 

int kişiSayısınıAl()
{
    write("Kaç kişilik olduğunu yazınız(2 yada 4) :");
    return to!(int)(strip(readln()));
}

int bitmePuanınıAl()
{
    write("Kaç puanda bitirmek istediğinizi yazınız :");
    return to!(int)(strip(readln()));
    
}
