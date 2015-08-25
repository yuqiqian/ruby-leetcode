using System;
namespace TypeConversionApplication
{
	class ExplicitConversion
	{
		static void Main(string[] args)
		{
			double d = 5673.74;
			int i;

			i = (int)d;
			Console.WriteLine(i);
			Console.ReadKey();
		}
	}

	class StringConversion
	{
		static void Main(string[] args)
		{
			int i = 75;
			float f = 53.005f;
			double d = 2345.7652;
			bool b = true;

			Console.WriteLine(i.ToString());
			Console.WriteLine(f.ToString());
			
		}
	}
}