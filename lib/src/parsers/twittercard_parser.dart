import 'package:html/dom.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:metadata_fetch/src/utils/util.dart';

import 'base_parser.dart';

/// Takes a [http.Document] and parses [Metadata] from [<meta property='twitter:*'>] tags
class TwitterCardParser with BaseMetadataParser {
  final Document? _document;
  TwitterCardParser(this._document);

  /// Get [Metadata.title] from 'twitter:title'
  @override
  String? get title =>
      getProperty(
        _document,
        attribute: 'name',
        property: 'twitter:title',
      ) ??
      getProperty(
        _document,
        property: 'twitter:title',
      );

  /// Get [Metadata.description] from 'twitter:description'
  @override
  String? get description =>
      getProperty(
        _document,
        attribute: 'name',
        property: 'twitter:description',
      ) ??
      getProperty(
        _document,
        property: 'twitter:description',
      );

  /// Get [Metadata.image] from 'twitter:image'
  @override
  String? get image =>
      getProperty(
        _document,
        attribute: 'name',
        property: 'twitter:image',
      ) ??
      getProperty(
        _document,
        property: 'twitter:image',
      );

  @override
  String? get card =>
      getProperty(
        _document,
        attribute: 'name',
        property: 'twitter:card',
      ) ??
      getProperty(
        _document,
        property: 'twitter:card',
      );

  /// Twitter Cards do not have a url property so get the url from [og:url], if available.
  @override
  String? get url => OpenGraphParser(_document).url;

  @override
  String toString() => parse().toString();
}
