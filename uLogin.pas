unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.StdCtrls,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, uPermissoes;

type
  TForm1 = class(TForm)
    Layout_Form: TLayout;
    Layout_Top: TLayout;
    Layout_Bottom: TLayout;
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabCadastro: TTabItem;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    RoundRect4: TRoundRect;
    Edit3: TEdit;
    RoundRect5: TRoundRect;
    Edit4: TEdit;
    RoundRect6: TRoundRect;
    Label2: TLabel;
    Image1: TImage;
    Layout4: TLayout;
    StyleBook2: TStyleBook;
    RoundRect7: TRoundRect;
    Edit5: TEdit;
    TabSalvar: TTabItem;
    TabAddFoto: TTabItem;
    Layout5: TLayout;
    Layout6: TLayout;
    RoundRect8: TRoundRect;
    Label3: TLabel;
    CircleFoto: TCircle;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Image2: TImage;
    Image3: TImage;
    Layout_Rodape_TLsalvar: TLayout;
    Layout_Rodape_TLsalvarFoto: TLayout;
    Image8: TImage;
    Layout_Rodape_TLFoto: TLayout;
    Image10: TImage;
    Image11: TImage;
    RoundRect1: TRoundRect;
    Edt_PLogin: TEdit;
    RoundRect2: TRoundRect;
    Edt_PSenha: TEdit;
    RoundRect3: TRoundRect;
    Label1: TLabel;
    Img_Logo: TImage;
    RoundRect9: TRoundRect;
    Label4: TLabel;
    ActionList1: TActionList;
    ActionCamera: TTakePhotoFromCameraAction;
    Layout_Body: TLayout;
    Z: TImage;
    ActionLibrary: TTakePhotoFromLibraryAction;
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure ZClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure ActionCameraDidFinishTaking(Image: TBitmap);
    procedure ActionLibraryDidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
    aPermissao: TPermissoes;
    procedure ErroPermissao(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ActionCameraDidFinishTaking(Image: TBitmap);
begin
  CircleFoto.Fill.Bitmap.Bitmap := Image;
  TabControl1.ActiveTab := TabSalvar;
end;

procedure TForm1.ActionLibraryDidFinishTaking(Image: TBitmap);
begin
  CircleFoto.Fill.Bitmap.Bitmap := Image;
  TabControl1.ActiveTab := TabSalvar;
end;

procedure TForm1.ErroPermissao(Sender: TObject);
begin
  ShowMessage('Sem permiss?o para acessar');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  aPermissao := TPermissoes.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  aPermissao.DisposeOf;
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabSalvar;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  aPermissao.Camera(ActionCamera, ErroPermissao)
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  aPermissao.PhotoLibrary(ActionLibrary, ErroPermissao);
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabLogin;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabCadastro;
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabSalvar;
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabCadastro;
end;

procedure TForm1.ZClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabAddFoto;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabSalvar;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabAddFoto;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabCadastro;
end;

end.
