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
    auto kart = OyunKartıTanımla();
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
    
    int birinciOyuncudakiPuan;
    int ikinciOyuncudakiPuan;
    int üçüncüOyuncudakiPuan;
    int dördüncüOyuncudakiPuan;
    
}

struct toplamPuan
{

    int birinciOyuncudakiToplamPuan;
    int ikinciOyuncudakiToplamPuan;
    int üçüncüOyuncudakiToplamPuan;
    int dördüncüOyuncudakiToplamPuan;

}
