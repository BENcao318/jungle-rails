describe('Add To Cart Test', () => {
  it('Visits the Home page', () => {
    cy.visit('/')
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Click the Add button on the first product", () => {
    cy.get(".nav-link").should("include.text", "My Cart (0)")
    cy.get(".products .btn")
      .first()
      .click({ force: true })
    cy.get(".nav-link").should("include.text", "My Cart (1)")
  });
})