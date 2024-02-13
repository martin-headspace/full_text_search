/// Extensions copied from dartxx-0.5.5\lib\lang_ext.dart


extension StringXX on String {
  bool get isNotBlank {
    return this.trim().isNotEmpty;
  }

  bool get isBlank {
    return this.trim().isEmpty;
  }
}

extension StringNullableXX on String? {
  bool get isNotNullOrBlank {
    return this != null && this!.isNotBlank;
  }

  bool get isNullOrBlank {
    return this == null || this!.isBlank;
  }
}

extension IterOfNullableXX<V> on Iterable<V?> {
  Iterable<V> notNull() {
    return this.where((element) => element != null).cast<V>();
  }

  Set<V> notNullSet() {
    return <V>{
      for (var i in this)
        if (i != null) i
    };
  }

  List<V> notNullList() {
    return <V>[...notNull()];
  }

  List<R> mapNotNull<R extends Object>(R? mapper(V from)) {
    return [
      for (var i in this)
        if (i != null) mapper(i),
    ].notNullList();
  }
}
