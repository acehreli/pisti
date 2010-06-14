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
	OyunKağıdı kart;
	kartPuanı puan;
	oynanmış oynanmış_mı;
	kartDavranışı davranış;
	
}
