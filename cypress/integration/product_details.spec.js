describe('My Product Test', () => {
  it('Visits the Home page', () => {
    cy.visit('/')
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Click the first product", () => {
    cy.get(".products a")
      .first()
      .click();
  });
})