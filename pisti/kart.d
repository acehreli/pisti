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
    tek          =1,
    çift         =2,
    üç           =3,
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
