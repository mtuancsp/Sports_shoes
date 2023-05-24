package model;

public class ProductImages {
    private int product_images_id;
    private int product_id;
    private String image_path;

    public ProductImages(int productImages_id, int product_id, String image_path) {
        this.product_images_id = productImages_id;
        this.product_id = product_id;
        this.image_path = image_path;
    }

    public ProductImages() {
    }

    public int getProduct_images_id() {
        return product_images_id;
    }

    public void setProduct_images_id(int product_images_id) {
        this.product_images_id = product_images_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }
}
