package Service;

import Beans.Product;
import DAO.IProductDAO;
import DAO.ProductDAO;

import java.util.List;

public class ProductService implements IProductService {
    private IProductDAO productDAO = new ProductDAO();
    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }

    @Override
    public Product findById(int id) {
        return productDAO.findById(id).stream().findFirst().get();
    }

    public static void main(String[] args) {
        ProductService productService = new ProductService();
        Product p = productService.findById(1);
        System.out.println(p);
    }
}
