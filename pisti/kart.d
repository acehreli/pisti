// Kart davranışları ve puanları burada tanımlanacak.
module kart;

import std.string;
import std.random;

struct OyunKartı
{
    
    dchar değer;
    dchar biçim;
    string toString()
    {
        return format("%s %s",değer,biçim);
    }
}
    
enum kartPuanı
{
    yok        =0,
    tek        =1,
    çift       =2,
    üç         =3,
}
enum piştiPuanı
{

    pişti       =10,
    valeliPişti =20 }

enum kartDavranışı
{
    normal,alır }

enum oynanmış
{
    evet,hayır }


struct DesteDeğer
{
    kartPuanı puan;
    piştiPuanı pişti;
    oynanmış oynanmış_mı;
    kartDavranışı davranış;
    
}


OyunKartı[] OyunKartıTanımla()
out (sonuç)
{
    assert(sonuç.length == 52);
}
body
{
    dchar[] biçimler="♠♡♢♣"d.dup;
    dchar[] değerler="234567890JQKA"d.dup;
    OyunKartı[] kart;
    foreach(değer;değerler){
        foreach(biçim;biçimler){
            kart~=OyunKartı(değer,biçim);
        }
    }
    randomShuffle(kart);
    return kart;
}

unittest
{
    auto boşKart = OyunKartı();

    auto deste = OyunKartıTanımla();
    foreach (i, kart; deste[0 .. $ - 1]) {
        // Bütün kartlar kurulmuş olmalı
        assert(kart != boşKart);

        foreach (ikinciKart; deste[i + 1 .. $]) {
            // Hiçbir kart tekrarlanmamalı
            assert(kart != ikinciKart);
        }
    }
}

/*
* A : 1 puan x 4 = 4 puan
* J : 1 puan x 4 = 4 puan //Alır //pişti 20 puan
* sinek 2'li: 2 puan x 1 = 2 puan
* Karo 10'lu: 3 puan x 1 = 3 puan
*
* */
DesteDeğer[OyunKartı] DesteDeğerTanımla(OyunKartı[] kartlar)
out (sonuç)
{
    assert(sonuç.length == kartlar.length);
}
body
{
    DesteDeğer[OyunKartı] değerler;
    foreach(kart;kartlar){
        if(kart.değer=='A'){
            değerler[kart]=DesteDeğer(kartPuanı.tek,piştiPuanı.pişti,
            oynanmış.hayır,kartDavranışı.normal);
            continue;
        }if(kart.değer=='J'){
            değerler[kart]=DesteDeğer(kartPuanı.tek,piştiPuanı.valeliPişti,
            oynanmış.hayır,kartDavranışı.alır);
            continue;
        }if((kart.değer=='2')&&(kart.biçim=='♣')){
            değerler[kart]=DesteDeğer(kartPuanı.çift,piştiPuanı.pişti,
            oynanmış.hayır,kartDavranışı.normal);
            continue;
        }if((kart.değer=='0')&&(kart.biçim=='♢')){
            değerler[kart]=DesteDeğer(kartPuanı.üç,piştiPuanı.pişti,
            oynanmış.hayır,kartDavranışı.normal);
            continue;
        }

        değerler[kart]=DesteDeğer(kartPuanı.yok,piştiPuanı.pişti,
        oynanmış.hayır,kartDavranışı.normal);
    }
    return değerler;
}

unittest
{
    auto değerler = DesteDeğerTanımla(OyunKartıTanımla());
    assert(OyunKartı('A', '♡') in değerler);
    assert(OyunKartı('2', '♣') in değerler);
}


