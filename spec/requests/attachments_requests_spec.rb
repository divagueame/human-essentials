RSpec.describe "Attachments", type: :request, skip_seed: true do
  before do
    sign_in(@user)
  end

  describe "DELETE #destroy" do
    let(:partner) { create(:partner, documents: [Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/dbase.pdf"), "application/pdf")]) }

    it "redirects to referrer" do
      delete attachment_path(partner.documents.first)
      expect(response).to redirect_to(partners_path)
    end
  end
end
