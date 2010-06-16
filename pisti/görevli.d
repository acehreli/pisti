// Puanları sayacak. Puanarı oyuncuya aktaracak. Oyuncuya kart çektircek...
import kart;
// dört tane oyun kartı alır. Aldığı 4 Oyun kartının dizisini döndürür
// ve bu 4 oyun kartını OyunKartı referans dizisinden çıkarır.
OyunKartı[] dörtOyunKartıAl(ref OyunKartı[] kartlar)
{
    OyunKartı[] atılacakKartlar=kartlar[0..4].dup;
    kartlar = kartlar[4..$];
    return atılacakKartlar;
}
unittest
{
    auto kart = OyunKartıTanımla();
    auto kart2 = kart.dup;
    auto kart3 = dörtOyunKartıAl(kart);
    assert(kart2[0..4]==kart3);
    assert(kart2[4..$]==kart);
}
