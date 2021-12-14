namespace BogZaplac.Api.Utils
{
    public class GetByteArrayFromImage
    {
        public static byte[] Get(IFormFile file)
        {
            using (var target = new MemoryStream())
            {
                file.CopyTo(target);
                return target.ToArray();
            }
        }
    }
}
