// Puanları sayacak. Puanları oyuncuya aktaracak. Oyuncuya kart çektirecek...
import kart;
// dört tane oyun kartı alır. Aldığı 4 Oyun kartının dizisini döndürür
// ve bu 4 oyun kartını OyunKartı referans dizisinden çıkarır.
OyunKartı[] dörtOyunKartıAl(ref OyunKartı[] kartlar)
in
{
    assert(kartlar.length >= 4);
}
out (sonuç)
{
    assert(sonuç.length == 4);

    /*
     * Burada, kartlar parametresinin uzunluğunun dört azaldığını da
     * denetlemek isterdik; ama D, in ve out blokları arasında iletişim
     * sağlamıyor. O yüzden eski uzunluğu in bloğunda saklayıp out
     * bloğundaki bir karşılaştırmada kullanamıyoruz.
     */
}
body
{
    OyunKartı[] atılacakKartlar=kartlar[0..4].dup;
    kartlar = kartlar[4..$];
    return atılacakKartlar;
}
unittest
{
    auto kart = yeniDeste();
    auto kart2 = kart.dup;
    auto kart3 = dörtOyunKartıAl(kart);
    assert(kart2[0..4]==kart3);
    assert(kart2[4..$]==kart);
}

OyunKartı[] yerdekiKartlar;

struct birEldekiHerşey  /// Bir elde tutulması gereken Puanlar Kartlar
{
    OyunKartı[] birinciOyuncudakiKartlar;
    OyunKartı[] ikinciOyuncudakiKartlar;
    OyunKartı[] üçüncüOyuncudakiKartlar;
    OyunKartı[] dördüncüOyuncudakiKartlar;
    
}

struct tümEl
{
    /// birinciOyuncudakiTümKartlarınDeğeri
    DesteDeğer[OyunKartı] bOTKD;
    DesteDeğer[OyunKartı] iOTKD;
    DesteDeğer[OyunKartı] üOTKD;
    DesteDeğer[OyunKartı] dOTKD;

}
// true ise alır false ise alamaz
bool alır_mı(OyunKartı atılan, OyunKartı yerdeki)
{
    return (atılan.değer == yerdeki.değer) || (atılan.değer == 'J');
}
unittest 
{ //♠♡♢♣
    auto a1 = OyunKartı('4','♠');
    auto a2 = OyunKartı('5','♠');
    
    auto a3 = OyunKartı('4','♣');
    auto a4 = OyunKartı('4','♠');
    
    auto a5 = OyunKartı('J','♢');
    auto a6 = OyunKartı('5','♠');
    assert(!alır_mı(a1,a2));
    
    assert(alır_mı(a3,a4));
    
    assert(alır_mı(a5,a6));


}
