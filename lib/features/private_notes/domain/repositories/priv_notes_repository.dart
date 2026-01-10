import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/features/private_notes/domain/entities/priv_notes.dart';

abstract class PrivNotesRepository {

  Future<Result<PrivNotes>> getPrivNotes();

  Future<Result<void>> addPrivNotes(PrivNotes privNotes);

  Future<Result<void>> updatePrivNotes(PrivNotes privNotes);

  Future<Result<void>> deletePrivNotes(PrivNotes privNotes);

}