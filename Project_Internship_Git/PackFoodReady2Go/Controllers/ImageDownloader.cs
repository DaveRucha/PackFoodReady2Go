namespace PackFoodReady2Go.UI.Controllers
{
    using System;
    using System.IO;
    using System.Net.Http;
    using System.Threading.Tasks;

    public class ImageDownloader
    {
        public async Task DownloadImage(string imageUrl, string localFilePath)
        {
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(imageUrl);
                if (response.IsSuccessStatusCode)
                {
                    using (var stream = await response.Content.ReadAsStreamAsync())
                    {
                        using (var fileStream = new FileStream(localFilePath, FileMode.Create))
                        {
                            await stream.CopyToAsync(fileStream);
                        }
                    }
                }
                else
                {
                    throw new Exception($"Failed to download image. Status code: {response.StatusCode}");
                }
            }
        }
    }

}

