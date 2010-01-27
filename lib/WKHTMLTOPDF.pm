
package WKHTMLTOPDF;

use Moose;
with 'MooseX::Role::Cmd';

our $VERSION = '0.02';

=head1 NAME

WKHTMLTOPDF - Perl interface to the wkhtmltopdf program for producing PDF-File from HTML-File.

=head1 SYNOPSIS

    use WKHTMLTOPDF;

    my $pdf = new WKHTMLTOPDF;
    $pdf->_input_file('test.html');
    $pdf->_output_file('test.pdf');
    $pdf->grayscale(1);

    $pdf->generate;

=head1 DESCRIPTION

Please, visit http://code.google.com/p/wkhtmltopdf/

=cut

use constant DEFAULT_BIN_NAME => '/usr/bin/wkhtmltopdf';

=head1 ATTRIBUTES

=head2 _input_file

Path of input file.

=cut

has '_input_file' => ( is => 'rw', isa => 'Str' );

=head2 _out_file

Path of output file.

=cut

has '_output_file' => ( is => 'rw', isa => 'Str' );

=head2 bin_name

Sets the binary executable name for the command you want to run. Defaul is /usr/bin/wkhtmltopdf.

=cut

has 'bin_name' => ( is => 'rw', isa => 'Str', default => DEFAULT_BIN_NAME );

=head2 General Options

=head3 collate

Collate when printing multiple copies.

=cut

has 'collate' => (is => 'rw', isa => 'Bool', default => 0);

=head3 copies

Number of copies to print into the pdf file. Default is 1.

=cut

has 'copies' => (is => 'rw', isa => 'Int');

=head3 orientation

Set orientation to Landscape or Portrait.

=cut

has 'orientation' => (is => 'rw', isa => 'Str');

=head3 page_size

Set paper size to: A4, Letter, etc.

=cut

has 'page_size' => (is => 'rw', isa => 'Str');

=head3 proxy

Use a proxy.

=cut

has 'proxy' => (is => 'rw', isa => 'Str');

=head3 username

HTTP Authentication username.

=cut

has 'username' => (is => 'rw', isa => 'Str');

=head3 password

HTTP Authentication password.

=cut

has 'password' => (is => 'rw', isa => 'Str');

=head3 custom_header

Set an additional HTTP header (repeatable).

=cut

has 'custom_header' => ( is => 'rw', isa => 'Str');

=head3 book

Set the options one would usually set when printing a book.

=cut

has 'book' => ( is => 'rw', isa => 'Bool', default => 0);

=head3 cover

Use html document as cover. It will be inserted before the toc with no headers and footers.

=cut

has 'cover' => (is => 'rw', isa => 'Str');

=head3 default_header

Add a default header, with the name of the page to the left, and the page number to the right, this is short for: --header-left='[webpage]' --header-right='[page]/[toPage]' --top 2cm --header-line.

=cut

has 'default_header' => (is => 'rw', isa => 'Bool', default => 0);

=head3 toc

Insert a table of content in the beginning of the document.

=cut

has 'toc' => (is => 'rw', isa => 'Bool', default => 0);

=head3 dpi

Change the dpi explicitly (this has no effect on X11 based systems).

=cut

has 'dpi' => (is => 'rw', isa => 'Str');

=head3 disable_javascript

Do not allow web pages to run javascript.

=cut

has 'disable_javascript' => (is => 'rw', isa => 'Bool', default => 0);

=head3 grayscale

PDF will be generated in grayscale.

=cut

has 'grayscale' => (is => 'rw', isa => 'Bool', default => 0);

=head3 lowquality

Generates lower quality pdf/ps. Useful to shrink the result document space.

=cut

has 'lowquality' => (is => 'rw', isa => 'Bool', default => 0);

=head3 margin_bottom

Set the page bottom margin (default 10mm).

=cut

has 'margin_bottom' => (is => 'rw', isa => 'Str');

=head3 margin_left

Set the page left margin (default 10mm).

=cut

has 'margin_left' => (is => 'rw', isa => 'Str');

=head3 margin_right

Set the page right margin (default 10mm).

=cut

has 'margin_right' => (is => 'rw', isa => 'Str');

=head3 margin_top

Set the page top margin (default 10mm).

=cut

has 'margin_top' => (is => 'rw', isa => 'Str');

=head3 redirect_delay

Wait some milliseconds for js-redirects (default 200).

=cut

has 'redirect_delay' => (is => 'rw', isa => 'Int');

=head3 enable_plugins

Enable installed plugins (such as flash).

=cut

has 'enable_plugins' => ( is => 'rw', isa => 'Bool', default => 0);

=head3 zoom

Use this zoom factor (default 1).

=cut

has 'zoom' => (is => 'rw', isa => 'Str');

=head3 disable_internal_links

Do no make local links.

=cut

has 'disable_internal_links' => (is => 'rw', isa => 'Bool', default => 0);

=head3 disable_external_links

Do no make links to remote web pages.

=cut

has 'disable_external_links' => (is => 'rw', isa => 'Bool', default => 0);

=head3 print_media_type

Use print media-type instead of screen.

=cut

has 'print_media_type' => (is => 'rw', isa => 'Bool', default => 0);

=head3 page_offset

Set the starting page number (default 1).

=cut

has 'page_offset' => (is => 'rw', isa => 'Int');

=head3 disable_smart_shrinking 

Disable the intelligent shrinking strategy used by WebKit that makes the pixel/dpi ratio none constant.

=cut

has 'disable_smart_shrinking' => (is => 'rw', isa => 'Bool', default => 0);

=head3 use_xserver

Use the X server (some plugins and other stuff might not work without X11).

=cut

has 'use_xserver' => (is => 'rw', isa => 'Bool', default => 0);

=head3 enconding

Set the default text encoding, for input.

=cut

has 'encoding' => ( is => 'rw', isa => 'Str');

=head3 no_background

Do not print background.

=cut

has 'no_background' => (is => 'rw', isa => 'Bool', default => 0);

=head3 user_style_sheet

Specify a user style sheet, to load with every page.

=cut

has 'user_style_sheet' => (is => 'rw', isa => 'Str');

=head2 Headers and footer options

=head3 footer_center

Centered footer text.

=cut

has 'footer_center' => (is => 'rw', isa => 'Str');

=head3 footer_font_name

Set footer font name (default Arial)

=cut

has 'footer_font_name' => (is => 'rw', isa => 'Str');

=head3 footer_font_size

Set footer font size (default 11)

=cut

has 'footer_font_size' => (is => 'rw', isa => 'Int');

=head3 footer_left

Left aligned footer text.

=cut

has 'footer_left' => (is => 'rw', isa => 'Str');

=head3 footer_line

Display line above the footer

=cut

has 'footer_line' => (is => 'rw', isa => 'Bool', default => 0);

=head3 footer_right

Right aligned footer text.

=cut

has 'footer_right' => (is => 'rw', isa => 'Str');

=head3 footer_spacing

Spacing between footer and content in mm (default 0).

=cut

has 'footer_spacing' => (is => 'rw', isa => 'Str');

=head3 footer_html

Adds a html footer.

=cut

has 'footer_html' => (is => 'rw', isa => 'Str');


=head3 header_center

Centered header text.

=cut

has 'header_center' => (is => 'rw', isa => 'Str');

=head3 header_font_name

Set header font name (default Arial)

=cut

has 'header_font_name' => (is => 'rw', isa => 'Str');

=head3 header_font_size

Set header font size (default 11)

=cut

has 'header_font_size' => (is => 'rw', isa => 'Int');

=head3 header_left

Left aligned header text.

=cut

has 'header_left' => (is => 'rw', isa => 'Str');

=head3 header_line

Display line above the header.

=cut

has 'header_line' => (is => 'rw', isa => 'Bool', default => 0);

=head3 header_right

Right aligned header text.

=cut

has 'header_right' => (is => 'rw', isa => 'Str');

=head3 header_spacing

Spacing between header and content in mm (default 0).

=cut

has 'header_spacing' => (is => 'rw', isa => 'Str');

=head3 header_html

Adds a html header header.

=cut

has 'header_html' => (is => 'rw', isa => 'Str');

=head2 Table of content options

=head3 toc_font_name

Set the font used for the toc (default Arial)

=cut

has 'toc_font_name' => (is => 'rw', isa => 'Str');

=head3 toc_no_dots

Do not use dots, in the toc

=cut

has 'toc_no_dots' => (is => 'rw', isa => 'Bool');

=head3 toc_depth

Set the depth of the toc (default 3).

=cut

has 'toc_depth' => (is => 'rw', isa => 'Int');

=head3 toc_header_text

The header text of the toc (default Table Of Contents).

=cut

has 'toc_header_text' => (is => 'rw', isa => 'Str');

=head3 toc_header_fs

The font size of the toc header (default 15).

=cut

has 'toc_hedaer_fs' => (is => 'rw', isa => 'Int');

=head3 toc_disable_links

Do not link from toc to sections

=cut

has 'toc_disable_links' => (is => 'rw', isa => 'Bool', default => 0);

=head3 toc_disable_back_links 

Do not link from section header to toc.

=cut

has 'toc_disable_back_links' => (is => 'rw', isa => 'Bool', default => 0);

=head3 toc_l1_font_size

Set the font size on level 1 of the toc (default 12)

=cut

has 'toc_l1_font_size' => (is => 'rw', isa => 'Int');

=head3 toc_l1_indentation

Set indentation on level 1 of the toc (default 0)

=cut

has 'toc_l1_indentation' => (is => 'rw', isa => 'Int');

=head3 toc_l2_font_size

Set the font size on level 2 of the toc (default 10)

=cut

has 'toc_l2_font_size' => (is => 'rw', isa => 'Int');

=head3 toc_l2_indentation

Set indentation on level 2 of the toc (default 20)

=cut

has 'toc_l2_indentation' => (is => 'rw', isa => 'Int');

=head3 toc_l3_font_size

Set the font size on level 3 of the toc (default 8)

=cut

has 'toc_l3_font_size' => (is => 'rw', isa => 'Int');

=head3 toc_l3_indentation

Set indentation on level 3 of the toc (default 40)

=cut

has 'toc_l3_indentation' => (is => 'rw', isa => 'Int');

=head3 toc_l4_font_size

Set the font size on level 6 of the toc (default 6)

=cut

has 'toc_l4_font_size' => (is => 'rw', isa => 'Int');

=head3 toc_l4_indentation

Set indentation on level 4 of the toc (default 6)

=cut

has 'toc_l4_indentation' => (is => 'rw', isa => 'Int');

=head3 toc_l5_font_size

Set the font size on level 5 of the toc (default 4)

=cut

has 'toc_l5_font_size' => (is => 'rw', isa => 'Int');

=head3 toc_l5_indentation

Set indentation on level 5 of the toc (default 80)

=cut

has 'toc_l5_indentation' => (is => 'rw', isa => 'Int');

=head3 toc_l6_font_size

Set the font size on level 6 of the toc (default 2)

=cut

has 'toc_l6_font_size' => (is => 'rw', isa => 'Int');

=head3 toc_l6_indentation

Set indentation on level 6 of the toc (default 100)

=cut

has 'toc_l6_indentation' => (is => 'rw', isa => 'Int');

=head3 toc_l7_font_size

Set the font size on level 7 of the toc (default 0)

=cut

has 'toc_l7_font_size' => (is => 'rw', isa => 'Int');

=head3 toc_l7_indentation

Set indentation on level 7 of the toc (default 120)

=cut

has 'toc_l7_indentation' => (is => 'rw', isa => 'Int');

=head2 Outline options

=head3 outline

Put an outline into the pdf.

=cut

has 'outline' => (is => 'rw', isa => 'Bool', default => 0);

=head3 outline_depth

Set the depth of the outline (default 4).

=cut

has 'outline_depth' => (is => 'rw', isa => 'Int');

=head1 METHODS

=head2 generate

Generate the PDF-File form a HTML-File.

=cut

sub generate {
    my $self = shift;
    $self->run(($self->_input_file, $self->_output_file));

}

=head1 AUTHOR

Thiago Rondon <thiago@aware.com.br>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under the same terms as Perl itself.

=cut


1;

