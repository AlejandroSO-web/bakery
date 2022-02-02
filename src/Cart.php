<?php
namespace App;

use Symfony\Component\HttpFoundation\RequestStack;

class Cart
{
    private $session;

    /**
     * Crea la variable de sesión cart
     */
    public function __construct(RequestStack $requestStack) {
        $this->session = $requestStack->getSession();
        $this->create();
    }
    /**
     * Crea el carrito
     */
    public function create(){
      $this->session->set('cart', []);
    }
    /**
     * @return array
     */
    public function getCart(): array {
        return  $this->session->get('cart');
    }
    
    /**
    *	Añade o actualiza la cantidad de un item en el carrito
    *	@id ID del producto a añadir / modificar
    */
    public function addItem($id, $cantidad) {
      $c = $this->getCart();
      $c[$id] = $cantidad;     
      $this->session->set('cart', $c);
    }

    /**
    *	Comprueba si el item está o no en el carrito
    *	@id ID del producto a comprobar
    *	@return true si el producto ya está en el carrito o false en caso contrario
    */
    public function itemExists($id) {
      return array_key_exists($id, $this->getCart());
    }
    /**
    *	Devuelve la cantidad comprada de un producto
    *	@return La cantidad comprada o 0 si no está en el carrito
    */
    public function getItemCount($id) {
      if (!$this->itemExists($id))
        return 0;
      else
        return $this->getCart()[$id];
    }

    /**
    *	Elimina un item del carrito
    *	@id ID del producto a eliminar
    */
    public function deleteItem($id) {
      $c = $this->getCart();
      unset($c[$id]);
      $this->session->set('cart', $c);
    }

    /**
    *	Elimina todos los items del carrito
    */
    public function empty() {
      $this->create();
    }
    
    /**
     * Devuelve true si el carro está vacío
     *
     * @return boolean
     */
    public function isEmpty(): bool {
       return ($this->howMany() === 0);
    }
  
    /**
    * Devuelve el número total de productos comprados
    * @return el número total de productos comprados o 0 si no hay ninguno
    */
    public function howMany(){
      return array_sum($this->session->get('cart'));
    }
}