/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enums;

/**
 *
 * @author My Computer
 */
public class StatusEnum {
    public enum OrderStatus{
        PENDING(0) , PROCESSING(1) , DONE(2);
        private final int value;

        private OrderStatus(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
        
    }
    
    public enum ProductStatus{
        ALL(-1) , INACTIVE(0) , ACTIVE(1) ;
        private final int value;

        private ProductStatus(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
        
    }
}
