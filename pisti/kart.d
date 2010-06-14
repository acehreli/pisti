// Kart davranışları ve puanları burada tanımlanacak.
module kart;

import std.string;

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
    yok          =0,
    tek          =1,
    çift         =2,
    üç           =3,
}
enum piştiPuanı
{

    pişti        =10,
    valeliPişti  =20        }

enum kartDavranışı
{
    normal,alır  }

enum oynanmış
{
    evet,hayır }


struct DesteDeğer
{
    OyunKartı kart;
    kartPuanı puan;
    piştiPuanı pişti;
    oynanmış oynanmış_mı;
    kartDavranışı davranış;
    
}


OyunKartı[] OyunKartıTanımla()
{
    dchar[] biçimler="♠♡♢♣"d.dup;
    dchar[] değerler="234567890JQKA"d.dup;
    OyunKartı[] kart;
    foreach(değer;değerler){
        foreach(biçim;biçimler){
            kart~=OyunKartı(değer,biçim);
        }
    }
    
    return kart;
}
///////// Özel kartlar için DesteDeğer Şuanlık hatalı.
/*
 * A         : 1 puan x 4 = 4 puan
 * J         : 1 puan x 4 = 4 puan  //Alır //pişti 20 puan
 * sinek 2'li: 2 puan x 1 = 2 puan
 * Karo 10'lu: 3 puan x 1 = 3 puan
 * 
 * */
DesteDeğer[] DesteDeğerTanımla(OyunKartı[] kartlar)
{
	DesteDeğer[] değerler;
	foreach(kart;kartlar){
		değerler~=DesteDeğer(kart,kartPuanı.yok,piştiPuanı.pişti,oynanmış.hayır,kartDavranışı.normal);
	}
	return değerler;
}
