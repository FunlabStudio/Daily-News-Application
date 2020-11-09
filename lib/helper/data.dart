import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/country_model.dart';


List<CategoryModel> getCategory(String code){
 List<CategoryModel> category = new List();
 CategoryModel categoryModel;
 //1
 categoryModel= new CategoryModel();
 categoryModel.countryCode = code;
 categoryModel.categoryName = "Business";
 categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
 category.add(categoryModel);

 categoryModel= new CategoryModel();
 categoryModel.countryCode = code;
 categoryModel.categoryName = "Entertainment";
 categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
 category.add(categoryModel);

 categoryModel= new CategoryModel();
 categoryModel.countryCode = code;
 categoryModel.categoryName = "General";
 categoryModel.imageAssetUrl ="https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
 category.add(categoryModel);

 categoryModel= new CategoryModel();
 categoryModel.countryCode = code;
 categoryModel.categoryName = "Health";
 categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
 category.add(categoryModel);

 categoryModel= new CategoryModel();
 categoryModel.countryCode = code;
 categoryModel.categoryName = "Science";
 categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
 category.add(categoryModel);

 categoryModel= new CategoryModel();
 categoryModel.countryCode = code;
 categoryModel.categoryName = "Sports";
 categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
 category.add(categoryModel);

 categoryModel= new CategoryModel();
 categoryModel.countryCode = code;
 categoryModel.categoryName = "Technology";
 categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
 category.add(categoryModel);

 return category;
}

List<CountryModel> getCountry(){
 List<CountryModel> country = new List();
 CountryModel countryModel;
 //1
 countryModel= new CountryModel();
 countryModel.countryName = 'Canada';
 countryModel.countryCode = "ca";
 countryModel.imageAssetUrl = "https://www.cia.gov/library/publications/the-world-factbook/attachments/flags/CA-flag.jpg";
 country.add(countryModel);

 countryModel= new CountryModel();
 countryModel.countryName = 'India';
 countryModel.countryCode = "in";
 countryModel.imageAssetUrl = "https://www.cia.gov/library/publications/the-world-factbook/attachments/flags/IN-flag.jpg";
 country.add(countryModel);

 countryModel= new CountryModel();
 countryModel.countryName = 'Ukraine';
 countryModel.countryCode = "ua";
 countryModel.imageAssetUrl = "https://www.cia.gov/library/publications/the-world-factbook/attachments/flags/UP-flag.jpg";
 country.add(countryModel);

 countryModel= new CountryModel();
 countryModel.countryName = 'USA';
 countryModel.countryCode = "us";
 countryModel.imageAssetUrl = "https://www.cia.gov/library/publications/the-world-factbook/attachments/flags/US-flag.jpg";
 country.add(countryModel);

 countryModel= new CountryModel();
 countryModel.countryName = 'China';
 countryModel.countryCode = "cn";
 countryModel.imageAssetUrl = "https://www.cia.gov/library/publications/the-world-factbook/attachments/flags/CH-flag.jpg";
 country.add(countryModel);

 return country;
}

