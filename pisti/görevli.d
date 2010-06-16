// Puanları sayacak. Puanarı oyuncuya aktaracak. Oyuncuya kart çektircek...
import kart;

OyunKartı[] yereOyunKartıAt(ref OyunKartı[] kartlar)
{
    OyunKartı[] atılacakKartlar=kartlar[0..4].dup;
    kartlar = kartlar[4..$];
    return atılacakKartlar;
}
unittest
{
    auto kart = OyunKartıTanımla();
    auto kart2 = kart.dup;
    auto kart3 = yereOyunKartıAt(kart);
    assert(kart2[0..4]==kart3);
    assert(kart2[4..$]==kart);
}
