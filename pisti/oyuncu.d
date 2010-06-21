// Hangi kartı atacağını belirleyecek.(Yapayzeka : Oyuncu)
import kart;
import std.random;

OyunKartı gelişiGüzelSeç(ref OyunKartı[] kartlar)
{
    int sayı  = uniform(0,kartlar.length);
    OyunKartı   seçilenKart = kartlar[sayı];
    kartlar   = kartlar[0..sayı].dup ~ kartlar[sayı+1..$].dup;
    return seçilenKart;
}
